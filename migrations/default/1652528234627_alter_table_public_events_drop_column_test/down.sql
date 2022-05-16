alter table "public"."events" alter column "test" drop not null;
alter table "public"."events" add column "test" text;
