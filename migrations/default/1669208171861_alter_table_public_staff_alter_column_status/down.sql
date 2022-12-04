alter table "public"."staff" alter column "status" set not null;
alter table "public"."staff" alter column "status" set default 'invited'::text;
