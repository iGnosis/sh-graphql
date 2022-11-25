alter table "public"."patient" add constraint "patient_email_organizationId_phoneCountryCode_phoneNumber_key" unique ("email", "organizationId", "phoneCountryCode", "phoneNumber");
