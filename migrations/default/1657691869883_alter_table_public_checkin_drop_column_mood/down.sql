alter table "public"."checkin" alter column "mood" drop not null;
alter table "public"."checkin" add column "mood" text;
