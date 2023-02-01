alter table "public"."staff" add column IF NOT EXISTS "password" text null;
alter table "public"."staff" drop column "password" cascade;

INSERT INTO "public"."staff"("email", "createdAt", "updatedAt", "firstName", "lastName", "type", "status", "id", "phoneCountryCode", "phoneNumber", "organizationId") VALUES (E'test-therapist@example.com', E'2022-12-14T06:32:09.325479+00:00', E'2022-12-14T06:32:09.325479+00:00', E'Test Therapist', null, E'therapist', E'active', E'f81db14b-a59f-4c98-b663-5168fa7d0b41', E'+00', E'0000000000', E'00000000-0000-0000-0000-000000000000');