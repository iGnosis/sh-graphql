alter table "public"."checkin" alter column "genre" drop not null;
alter table "public"."checkin" add column "genre" text;
