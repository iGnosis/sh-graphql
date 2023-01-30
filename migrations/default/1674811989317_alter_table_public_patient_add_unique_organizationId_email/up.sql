alter table "public"."patient" add constraint "patient_organizationId_email_key" unique ("organizationId", "email");
