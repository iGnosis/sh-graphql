CREATE TABLE "public"."session_type" ("name" text NOT NULL, "description" text NOT NULL, PRIMARY KEY ("name") , UNIQUE ("name"), UNIQUE ("description"));COMMENT ON TABLE "public"."session_type" IS E'enums for session';