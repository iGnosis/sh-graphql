alter table "public"."events" alter column "test_col" drop not null;
alter table "public"."events" add column "test_col" int4;
