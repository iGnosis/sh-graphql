alter table "public"."checkin" alter column "updated_at" drop not null;
alter table "public"."checkin" add column "updated_at" timestamptz;
