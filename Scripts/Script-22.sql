CREATE TABLE personal (
 id SERIAL PRIMARY KEY,
 name text,
 department text,
 chief_id integer REFERENCES personal
);