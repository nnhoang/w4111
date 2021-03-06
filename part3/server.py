#!/usr/bin/env python2.7

"""
Columbia W4111 Intro to databases
Example webserver

To run locally

    python server.py

Go to http://localhost:8111 in your browser


A debugger such as "pdb" may be helpful for debugging.
Read about it online.

eugene wu 2015
"""

import datetime
import os
from sqlalchemy import *
from sqlalchemy.pool import NullPool
from flask import Flask, request, render_template, g, redirect, Response, session, url_for, flash
from werkzeug.security import generate_password_hash, check_password_hash

tmpl_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'templates')
app = Flask(__name__, template_folder=tmpl_dir)
app.secret_key = 'IJ*TD B^&RT&D^F S&^FDFGDS&FG** *J*(J(DJSAD?'

#
# The following uses the sqlite3 database test.db -- you can use this for debugging purposes
# However for the project you will need to connect to your Part 2 database in order to use the
# data
#
# XXX: The URI should be in the format of:
#
#     postgresql://USER:PASSWORD@w4111db1.cloudapp.net:5432/proj1part2
#
# For example, if you had username ewu2493, password foobar, then the following line would be:
#
#     DATABASEURI = "postgresql://ewu2493:foobar@w4111db1.cloudapp.net:5432/proj1part2"
#
DATABASEURI = "postgresql://nnh2110:627@w4111db1.cloudapp.net:5432/proj1part2"
#DATABASEURI = "postgresql://tz2278:242@w4111db1.cloudapp.net:5432/proj1part2"


#
# This line creates a database engine that knows how to connect to the URI above
#
engine = create_engine(DATABASEURI)


#
# START SQLITE SETUP CODE
#
# after these statements run, you should see a file test.db in your webserver/ directory
# this is a sqlite database that you can query like psql typing in the shell command line:
#
#     sqlite3 test.db
#
# The following sqlite3 commands may be useful:
#
#     .tables               -- will list the tables in the database
#     .schema <tablename>   -- print CREATE TABLE statement for table
#
# The setup code should be deleted once you switch to using the Part 2 postgresql database
#
engine.execute("""DROP TABLE IF EXISTS test;""")
engine.execute("""CREATE TABLE IF NOT EXISTS test (
  id serial,
  name text
);""")
engine.execute("""INSERT INTO test(name) VALUES ('grace hopper'), ('alan turing'), ('ada lovelace');""")
engine.execute('INSERT INTO test(name) VALUES (%s), (%s)', 'hehe', 'hoho')
#
# END SQLITE SETUP CODE
#



@app.before_request
def before_request():
  """
  This function is run at the beginning of every web request
  (every time you enter an address in the web browser).
  We use it to setup a database connection that can be used throughout the request

  The variable g is globally accessible
  """
  try:
    g.conn = engine.connect()
  except:
    print "uh oh, problem connecting to database"
    import traceback; traceback.print_exc()
    g.conn = None

@app.teardown_request
def teardown_request(exception):
  """
  At the end of the web request, this makes sure to close the database connection.
  If you don't the database could run out of memory!
  """
  try:
    g.conn.close()
  except Exception as e:
    pass

def get_checklist(taskid):
    cursor = g.conn.execute("SELECT * FROM checklist C WHERE C.task_id = (%s);", taskid)
    checklist = [dict(cid=row[0], status=row[1], name=row[2]) for row in cursor.fetchall()]
    cursor.close()
    return checklist

def task_status(taskid):
    cursor = g.conn.execute("SELECT C.status FROM checklist C WHERE C.task_id = (%s);", taskid)
    complete = 0
    count = 0
    for row in cursor:
        count = count + 1
        if (row[0]):
                complete = complete + 1
    return int(float(complete)/float(count)) * 100 if count else None


def get_username(uid):
    if uid == None:
        return uid
    cursor = g.conn.execute("SELECT A.name FROM account A WHERE A.aid = (%s);", uid)
    username = cursor.fetchone()[0]
    cursor.close()
    return username

def get_task(lid):
    task_cursor = g.conn.execute("SELECT * FROM task T WHERE T.list_id = (%s);", lid)
    tasks=[]
    for result in task_cursor:
        tasks.append(dict(tid=result[0], label=get_label_for_task(result[0]), checklist=get_checklist(result[0]),due=result[1],description=result[2], name=result[3], assigned_to=get_username(result[4]), last_editor=get_username(result[5]), status=result[7], when_completed=result[8]))
    task_cursor.close()
    return tasks

def get_labels(lid):
    label_cursor = g.conn.execute("SELECT * FROM label L WHERE L.list_id = (%s);", lid)
    labels=[]
    for r in label_cursor:
        labels.append(dict(lid=r[0], task=get_task_underlabel(r[0]),name=r[1],color=r[2]))
    label_cursor.close()
    return labels

def get_task_underlabel(label_id):
    task_cursor = g.conn.execute("SELECT * From task T INNER JOIN label_task LT ON LT.task_id = T.tid WHERE LT.label_id=(%s);", label_id)
    tasks=[]
    for result in task_cursor:
        tasks.append(dict(tid=result[0], label=get_label_for_task(result[0]), checklist=get_checklist(result[0]), completeness=task_status(result[0]), due=result[1], description=result[2], name=result[3], assigned_to=get_username(result[4]), last_editor=get_username(result[5]), status=result[7], when_completed=result[8]))
    task_cursor.close()
    return tasks

def get_comments(lid):
    cursor = g.conn.execute("SELECT * FROM comment C WHERE C.list_id = (%s) ORDER BY C.since DESC;", lid)
    comments = []
    for r in cursor:
        comments.append(dict(cid=r[0], since=r[1], content=r[2], list_id=r[3], sender=get_username(r[4])))
    cursor.close()
    return comments

def check_edit(list_id, aid):
    cursor = g.conn.execute("SELECT AU.type FROM accessible_user AU WHERE AU.list_id=(%s) AND AU.account_id=(%s)", list_id, aid)
    for r in cursor:
        accessible = r[0]
    cursor.close()
    ownerid = None
    cursor = g.conn.execute("SELECT L.owner FROM list L WHERE L.lid=(%s)", list_id)
    for r in cursor:
        ownerid = r[0]
    if (ownerid == aid) :
        accessible = true
    return accessible


def get_label_for_task(task_id):
    cursor = g.conn.execute("SELECT L.lid, L.name, L.color from label_task LT INNER JOIN label L on LT.label_id = L.lid where LT.task_id = (%s)", task_id)
    labels = []
    for r in cursor:
        labels.append(dict(lid=r[0], name=r[1], color=r[2], task_id=task_id))
    cursor.close()
    return labels


class InsertQuery:
  def __init__(self, table_name):
    self.keys = []
    self.ses = []
    self.values = []
    self.table_name = table_name

  def add(self, attr, value):
    self.keys.append(attr)
    self.ses.append('%s')
    self.values.append(value)

  def execute(self):
    try:
      query = 'INSERT INTO {} ({}) VALUES ({}) RETURNING *;'.format(
          self.table_name, ', '.join(self.keys), ', '.join(self.ses))
      print 'EXECUTING QUERY:', query, 'params:', self.values
      return g.conn.execute(query, self.values).fetchone()
    except:
      return None


#
# @app.route is a decorator around index() that means:
#   run index() whenever the user tries to access the "/" path using a POST or GET request
#
# If you wanted the user to go to e.g., localhost:8111/foobar/ with POST or GET then you could use
#
#       @app.route("/foobar/", methods=["POST", "GET"])
#
# PROTIP: (the trailing / in the path is important)
#
# see for routing: http://flask.pocoo.org/docs/0.10/quickstart/#routing
# see for decorators: http://simeonfranklin.com/blog/2012/jul/1/python-decorators-in-12-steps/
#
@app.route('/', methods=["POST", "GET"])
def index():
  """
  request is a special object that Flask provides to access web request information:

  request.method:   "GET" or "POST"
  request.form:     if the browser submitted a form, this contains the data in the form
  request.args:     dictionary of URL arguments e.g., {a:1, b:2} for http://localhost?a=1&b=2

  See its API: http://flask.pocoo.org/docs/0.10/api/#incoming-request-data
  """

  # DEBUG: this is debugging code to see what request looks like
  # print request.args


  #
  # example of a database query
  #
  if 'uid' not in session or not session['uid']:
    return redirect(url_for('login'))


  cursor = g.conn.execute("SELECT name FROM test;")
  names = []
  for result in cursor:
    names.append(result['name'])  # can also be accessed using result[0]
  cursor.close()

  uid = session['uid'] if 'uid' in session else None
  lists = []
  username = None
  if uid != None:
      username = get_username(uid)
      listcursor = g.conn.execute("Select L.lid, L.owner, L.name FROM accessible_user AU INNER JOIN list L ON AU.list_id = L.lid INNER JOIN account A ON AU.account_id = A.aid WHERE A.aid = (%s);", uid)
      for result in listcursor:
          lists.append(dict(task_all=get_task(result[0]), lid=result[0], label=get_labels(result[0]), owner=get_username(result[1]), name=result[2], comments=get_comments(result[0]), edit=check_edit(result[0],uid)))
      listcursor.close()

  labels = None




  #
  # Flask uses Jinja templates, which is an extension to HTML where you can
  # pass data to a template and dynamically generate HTML based on the data
  # (you can think of it as simple PHP)
  # documentation: https://realpython.com/blog/python/primer-on-jinja-templating/
  #
  # You can see an example template in templates/index.html
  #
  # context are the variables that are passed to the template.
  # for example, "data" key in the context variable defined below will be
  # accessible as a variable in index.html:
  #
  #     # will print: [u'grace hopper', u'alan turing', u'ada lovelace']
  #     <div>{{data}}</div>
  #
  #     # creates a <div> tag for each element in data
  #     # will print:
  #     #
  #     #   <div>grace hopper</div>
  #     #   <div>alan turing</div>
  #     #   <div>ada lovelace</div>
  #     #
  #     {% for n in data %}
  #     <div>{{n}}</div>
  #     {% endfor %}
  #
  context = dict( data = names )
  context['list_result'] = lists




  #
  # render_template looks in the templates/ folder for files.
  # for example, the below file reads template/index.html
  #
  return render_template("home.html", labels = labels, username=username, **context)

# list of table to be created for create() and the attributes that can get from request.form
tables = {'task': ('due', 'description', 'name', 'list_id'),
          'list': ('name',),
          'label': ('name', 'color', 'list_id'),
          'checklist': ('name', 'task_id'),
          'label_task': ('task_id', 'label_id'),
          'comment': ('content', 'list_id'),
          'accessible_user': ('list_id', 'type')}
@app.route('/create/<table>', methods=['POST'])
def create(table):
  if 'uid' in session and table in tables:
    uid = session['uid']
    query = InsertQuery(table)

    print 'possible attr', tables[table]
    print 'request.form:', request.form
    for key in tables[table]:
      if key in request.form and request.form[key]:
        query.add(key, request.form[key])

    if table == 'task':
      query.add('last_editor', uid)
      if request.form['assigned_to']:
        assigned_user = g.conn.execute('SELECT * FROM account WHERE email = %s', request.form['assigned_to']).fetchone()
        if assigned_user:
          query.add('assigned_to', assigned_user.aid)
        else:
          flash('Email has not been registered.')
          return redirect(url_for('index'))

    elif table == 'list':
      query.add('owner', uid)

    elif table == 'comment':
      query.add('sender', uid)
      query.add('since', datetime.datetime.now())

    elif table == 'accessible_user':
      shared = g.conn.execute('SELECT * FROM account WHERE email = %s', request.form['email']).fetchone()
      if shared and shared.aid != uid:
        query.add('account_id', shared.aid)
      else:
        if not shared:
          flash('Email has not been registered.')
        else:
          flash('You cannot add yourself.')
        return redirect(url_for('index'))

    elif table == 'label':
      color = request.form['color']
      if color and color not in ('blue', 'red', 'green', 'orange', 'white', 'black', 'yellow', 'purple'):
        flash('You cannot choose color {}'.format(color))
        return redirect(url_for('index'))

    result = query.execute()

    if not result:
      flash('Cannot create {}. Please check your input!'.format(table))
      return redirect(url_for('index'))

    if table == 'list':
      # add owner to accessible_list when user new list
      g.conn.execute('INSERT INTO accessible_user VALUES (%s, %s, %s)',
                     uid, result[0], 'true')
    elif table == 'task':
      g.conn.execute('INSERT INTO label_task VALUES (%s, %s)', result[0], request.form['label_id'])

    flash('{} created.'.format(table.capitalize()))
  return redirect(url_for('index'))

# list of tables to be used for delete() and the correspondin primary keys
primarykeys = {'task': 'tid', 'list': 'lid', 'label': 'lid', 'checklist': 'cid'}
@app.route('/delete/<table>', methods=['POST'])
def delete(table):
  if 'uid' in session and table in tables and 'id' in request.args:
    uid = session['uid']
    query = InsertQuery(table)
    print "DELETING:", request.args
    row_id = request.args['id']
    row_id2 = request.args['id2'] if 'id2' in request.args else None

    # TODO check for user right
    print row_id, row_id2
    if table in primarykeys:
      g.conn.execute('DELETE FROM {} WHERE {} = %s;'.format(table, primarykeys[table]), row_id)
      flash('{} deleted.'.format(table.capitalize()))
    elif table == 'label_task' and row_id2:
      print 'DELETING LABEL_TASK'
      g.conn.execute('DELETE FROM {} WHERE task_id = %s AND label_id = %s;'.format(table),
                     row_id, row_id2)
      flash('{} deleted.'.format(table.capitalize()))

    return 'done'
  return 'error'


@app.route('/login', methods=['GET', 'POST'])
def login():
  error = None
  if request.method == 'POST':
    user = g.conn.execute('SELECT * FROM account WHERE email = %s;', request.form['email']).fetchone()
    if user and check_password_hash(user['password'], request.form['password']):
      session['uid'] = user['aid']
      flash('Welcome, {}'.format(user.name))
      return redirect(url_for('index'))
    else:
      error = 'Invalid email or password'

  return render_template('login.html', error=error)

@app.route('/signup', methods=['GET', 'POST'])
def signup():
  error = None
  if request.method == 'POST':
    user = g.conn.execute('SELECT * FROM account WHERE email = %s;', request.form['email']).fetchone()
    if not user:
      password = generate_password_hash(request.form['password'])
      g.conn.execute('INSERT INTO account(email, name, password) VALUES (%s, %s, %s);',
                     request.form['email'], request.form['name'], password)
    else:
      error = 'User already exists. Please choose another email address!'

  return render_template('login.html', error=error)

@app.route('/logout')
def logout():
  if 'uid' in session:
    session.pop('uid', None)
  return redirect(url_for('login'))


#
# This is an example of a different path.  You can see it at
#
#     localhost:8111/another/
#
# notice that the functio name is another() rather than index()
# the functions for each app.route needs to have different names
#
@app.route('/another/', methods=["POST", "GET"])
def another():
  return render_template("anotherfile.html")

@app.route('/home', methods=["POST", "GET"])
def home():
  return render_template("home.html")

if __name__ == "__main__":
  import click

  @click.command()
  @click.option('--debug', is_flag=True)
  @click.option('--threaded', is_flag=True)
  @click.argument('HOST', default='0.0.0.0')
  @click.argument('PORT', default=8111, type=int)
  def run(debug, threaded, host, port):
    """
    This function handles command line parameters.
    Run the server using

        python server.py

    Show the help text using

        python server.py --help

    """

    HOST, PORT = host, port
    print "running on %s:%d" % (HOST, PORT)
    app.run(host=HOST, port=PORT, debug=debug, threaded=threaded)


  run()
