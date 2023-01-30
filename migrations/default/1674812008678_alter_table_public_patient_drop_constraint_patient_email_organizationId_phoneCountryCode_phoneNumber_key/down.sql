alter table "public"."patient" add constraint "patient_organizationId_phoneNumber_email_phoneCountryCode_key" unique ("organizationId", "phoneNumber", "email", "phoneCountryCode");
