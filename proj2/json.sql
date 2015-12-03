SELECT *
FROM task T
JOIN list L
ON T.list_id = L.lid
JOIN accessible_user A
ON L.lid = A.list_id
WHERE A.account_id = 1
AND T.optional->>'due'::timestamp < '01/02/2016';
