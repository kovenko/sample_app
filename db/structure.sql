CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "password_digest" varchar);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
INSERT INTO schema_migrations (version) VALUES ('20160219102539');

INSERT INTO schema_migrations (version) VALUES ('20160224061104');

INSERT INTO schema_migrations (version) VALUES ('20160224071003');

