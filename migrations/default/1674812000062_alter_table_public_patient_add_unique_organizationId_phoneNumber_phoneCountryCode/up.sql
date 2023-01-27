alter table "public"."patient" add constraint "patient_organizationId_phoneNumber_phoneCountryCode_key" unique ("organizationId", "phoneNumber", "phoneCountryCode");
