CREATE TABLE "public"."patient_badge" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "patient" uuid NOT NULL, "badge" uuid NOT NULL, "count" integer NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;
