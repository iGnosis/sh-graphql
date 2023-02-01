alter table "public"."staff" drop constraint "user_phoneNumber_key";
alter table "public"."staff" add constraint "staff_phoneNumber_organizationId_key" unique ("phoneNumber", "organizationId");
