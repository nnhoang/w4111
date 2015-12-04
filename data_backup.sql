-- db dump for proj1part3
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = nnh2110, pg_catalog;

--
-- Data for Name: account; Type: TABLE DATA; Schema: nnh2110; Owner: nnh2110
--

COPY account (aid, email, name, password) FROM stdin;
1	nam.hoang@columbia.edu	Nam	pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b
3	abhijit@columbia.edu	Abhijit	pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b
4	ayush@columbia.edu	Ayush	pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b
5	jincheng@columbia.edu	Jincheng	pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b
6	mengquing@columbia.edu	Mengquing	pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b
7	sania@columbia.edu	Sania	pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b
8	eugene@columbia.edu	Eugene	pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b
9	namhoang1909@gmail.com	Nam	pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b
10	abc@gmail.com	Abc	pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b
2	tz2278@columbia.edu	Tianci	pbkdf2:sha1:1000$61hbbUsv$147ba928a96f06efd2ee4956db731ff1d744ae1b
11	abc@edf.com	Nam	pbkdf2:sha1:1000$dEx9YNH0$04d58d58e97adf1b0cf1de08643105523090d7ff
\.


--
-- Data for Name: list; Type: TABLE DATA; Schema: nnh2110; Owner: nnh2110
--

COPY list (lid, owner, name) FROM stdin;
1	1	Work
3	3	DB proj1part2
4	4	DB hw0
6	6	Things to do before you die
7	7	Personal
8	8	abc def
10	1	oaskfd pj ijfei
11	9	Study
12	9	test1
13	1	hehe
14	1	test2
15	1	test3
16	1	another test
17	1	another test
18	1	realtest
20	11	Project 1
21	11	Project 2
22	2	Project1Part2
\.


--
-- Data for Name: accessible_user; Type: TABLE DATA; Schema: nnh2110; Owner: nnh2110
--

COPY accessible_user (account_id, list_id, type) FROM stdin;
1	6	f
3	4	f
4	4	f
5	4	f
1	4	f
2	6	f
4	10	f
9	1	f
10	6	f
8	6	t
10	1	f
2	3	f
1	10	t
3	8	t
4	8	t
5	7	t
6	6	t
2	4	t
6	3	t
8	1	t
1	18	t
2	10	f
11	20	t
2	20	f
11	21	t
2	22	t
11	22	t
\.


--
-- Name: account_aid_seq; Type: SEQUENCE SET; Schema: nnh2110; Owner: nnh2110
--

SELECT pg_catalog.setval('account_aid_seq', 11, true);


--
-- Data for Name: task; Type: TABLE DATA; Schema: nnh2110; Owner: nnh2110
--

COPY task (tid, due, description, name, assigned_to, last_editor, list_id, status, when_completed) FROM stdin;
1	2016-01-01 12:00:00	\N	new start of the year	\N	1	10	f	\N
3	2015-12-01 22:00:00	\N	task for list 8	\N	3	8	f	\N
5	2017-12-01 22:00:00	\N	task for list 7	\N	5	7	f	\N
6	2016-12-08 12:00:00	\N	task for list 6	8	6	6	f	\N
8	2015-01-01 12:00:00	just trying to generate random data	complete task for 4	3	2	4	t	2014-10-30 11:30:00
9	2016-12-08 12:00:00	blah blah blah	task for list 3	2	6	3	f	\N
19	\N	\N	meeting with Mengquing!!!	\N	1	18	f	\N
21	\N	\N	new task	\N	11	20	f	\N
\.


--
-- Data for Name: checklist; Type: TABLE DATA; Schema: nnh2110; Owner: nnh2110
--

COPY checklist (cid, status, name, task_id) FROM stdin;
1	t	under task 1	1
3	f	under task 3	3
5	f	under task 5	5
6	t	under task 6	6
8	t	under task 8	8
9	t	under task 9	9
\.


--
-- Name: checklist_cid_seq; Type: SEQUENCE SET; Schema: nnh2110; Owner: nnh2110
--

SELECT pg_catalog.setval('checklist_cid_seq', 23, true);


--
-- Data for Name: comment; Type: TABLE DATA; Schema: nnh2110; Owner: nnh2110
--

COPY comment (cid, since, content, list_id, sender) FROM stdin;
3	2014-01-02 12:05:02	ijhi	4	2
4	2014-05-02 02:02:32	hello?	1	9
5	2014-11-02 08:08:28	test	4	3
6	2014-01-02 03:02:32	pig	6	8
7	2014-11-02 05:01:07	dog	6	8
8	2014-02-02 02:09:46	cat	6	6
9	2014-04-02 03:03:09	tiger	6	10
10	2015-01-02 02:05:02	fish	6	10
15	2015-11-17 23:47:41.927065	testttt	4	1
16	2015-11-18 16:28:54.206045	hey\r\n	20	11
\.


--
-- Name: comment_cid_seq; Type: SEQUENCE SET; Schema: nnh2110; Owner: nnh2110
--

SELECT pg_catalog.setval('comment_cid_seq', 16, true);


--
-- Data for Name: label; Type: TABLE DATA; Schema: nnh2110; Owner: nnh2110
--

COPY label (lid, name, color, list_id) FROM stdin;
1	important	yellow	1
3	second propriety	orange	1
4	second propriety	orange	3
5	least	white	4
7	least	white	6
8	important	red	7
9	important	red	8
11	important	red	10
12	test	\N	1
13	test	\N	1
20	important	red	18
22	Important	red	20
23	part3	blue	20
\.


--
-- Name: label_lid_seq; Type: SEQUENCE SET; Schema: nnh2110; Owner: nnh2110
--

SELECT pg_catalog.setval('label_lid_seq', 23, true);


--
-- Data for Name: label_task; Type: TABLE DATA; Schema: nnh2110; Owner: nnh2110
--

COPY label_task (task_id, label_id) FROM stdin;
1	1
1	11
3	3
5	5
8	8
9	9
19	20
21	22
\.


--
-- Name: list_lid_seq; Type: SEQUENCE SET; Schema: nnh2110; Owner: nnh2110
--

SELECT pg_catalog.setval('list_lid_seq', 22, true);


--
-- Name: task_tid_seq; Type: SEQUENCE SET; Schema: nnh2110; Owner: nnh2110
--

SELECT pg_catalog.setval('task_tid_seq', 21, true);


--
-- Data for Name: test; Type: TABLE DATA; Schema: nnh2110; Owner: nnh2110
--

COPY test (id, name) FROM stdin;
1	grace hopper
2	alan turing
3	ada lovelace
4	hehe
5	hoho
\.


--
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: nnh2110; Owner: nnh2110
--

SELECT pg_catalog.setval('test_id_seq', 5, true);


--
-- PostgreSQL database dump complete
--

