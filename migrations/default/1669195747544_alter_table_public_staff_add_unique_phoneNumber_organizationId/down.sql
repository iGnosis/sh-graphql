alter table "public"."staff" drop constraint "staff_phoneNumber_organizationId_key";
alter table "public"."staff" add constraint "staff_phoneNumber_key" unique ("phoneNumber");
