alter table "public"."patient" drop constraint "patient_email_phoneCountryCode_phoneNumber_organizationId_key";
alter table "public"."patient" add constraint "patient_email_key" unique ("email");
