-- DROP SCHEMA "Entregable2";

CREATE SCHEMA "Entregable2" AUTHORIZATION postgres;

-- Drop table

-- DROP TABLE "Entregable2".category;

CREATE TABLE "Entregable2".category (
	id serial4 NOT NULL,
	"name" varchar NULL,
	CONSTRAINT category_pkey PRIMARY KEY (id)
);

-- Drop table

-- DROP TABLE "Entregable2"."comment";

CREATE TABLE "Entregable2"."comment" (
	id serial4 NOT NULL,
	"text" varchar NULL,
	CONSTRAINT comment_pkey PRIMARY KEY (id)
);

-- Drop table

-- DROP TABLE "Entregable2".posts;

CREATE TABLE "Entregable2".posts (
	id serial4 NOT NULL,
	title varchar NULL,
	description varchar NULL,
	author int4 NULL,
	"content" varchar NULL,
	categoryid int4 NULL,
	commentsid int4 NULL,
	CONSTRAINT posts_pkey PRIMARY KEY (id),
	CONSTRAINT posts_author_fkey FOREIGN KEY (author) REFERENCES "Entregable2".users(id),
	CONSTRAINT posts_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES "Entregable2".category(id),
	CONSTRAINT posts_comments_fkey FOREIGN KEY (commentsid) REFERENCES "Entregable2"."comment"(id)
);

-- Drop table

-- DROP TABLE "Entregable2".users;

CREATE TABLE "Entregable2".users (
	id serial4 NOT NULL,
	nombre varchar NULL,
	email varchar NULL,
	"password" varchar NULL,
	age int4 NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id)
);

-- Drop table

-- DROP TABLE "Entregable2".users_posts;

CREATE TABLE "Entregable2".users_posts (
	id serial4 NOT NULL,
	user_id int4 NULL,
	post_id int4 NULL,
	CONSTRAINT users_posts_pkey PRIMARY KEY (id),
	CONSTRAINT users_posts_post_id_fkey FOREIGN KEY (post_id) REFERENCES "Entregable2".posts(id),
	CONSTRAINT users_posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES "Entregable2".users(id)
);

INSERT INTO "Entregable2".category ("name") VALUES
	 ('Action'),
	 ('Comedy'),
	 ('Drama');
INSERT INTO "Entregable2"."comment" ("text") VALUES
	 ('This is the first comment'),
	 ('This is the second comment');
INSERT INTO "Entregable2".posts (title,description,author,"content",categoryid,commentsid) VALUES
	 ('first post','Description of the first post',2,'This is the content',2,1),
	 ('Second post','Desc about the second post',1,'MAIN CONTENT A',2,1);
INSERT INTO "Entregable2".users (nombre,email,"password",age) VALUES
	 ('Philippe','sevasdoge.01@gmail.com','123456',22),
	 ('Pancho_Hacker','correodepancho@correo.com','654321',11);
INSERT INTO "Entregable2".users_posts (user_id,post_id) VALUES
	 (1,1),
	 (1,2);
