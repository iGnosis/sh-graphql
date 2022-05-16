-- activity_difficulty
INSERT INTO "public"."activity_difficulty" ("name", "description") VALUES (E'Easy', E'');
INSERT INTO "public"."activity_difficulty" ("name", "description") VALUES (E'Moderate', E'');
INSERT INTO "public"."activity_difficulty" ("name", "description") VALUES (E'Hard', E'');

-- genre
INSERT INTO "public"."genre"("name", "description") VALUES (E'classical', E'');
INSERT INTO "public"."genre"("name", "description") VALUES (E'jazz', E'');

-- medical_condition
INSERT INTO "public"."medical_condition"("name", "description") VALUES (E'parkinson', E'Parkinson''s');
INSERT INTO "public"."medical_condition"("name", "description") VALUES (E'huntingtons', E'Huntington''s');
INSERT INTO "public"."medical_condition"("name", "description") VALUES (E'alzheimers', E'Alzheimer''s');

-- provider_type
INSERT INTO "public"."provider_type"("name", "description") VALUES (E'clinic', E'');
INSERT INTO "public"."provider_type"("name", "description") VALUES (E'hospital', E'');

-- user_relation_type
INSERT INTO "public"."user_relation_type"("name", "description") VALUES (E'caretaker', E'');
INSERT INTO "public"."user_relation_type"("name", "description") VALUES (E'therapist', E'');

-- user_status
INSERT INTO "public"."user_status"("name", "description") VALUES (E'active', E'');
INSERT INTO "public"."user_status"("name", "description") VALUES (E'inactive', E'');
INSERT INTO "public"."user_status"("name", "description") VALUES (E'dormant', E'');
INSERT INTO "public"."user_status"("name", "description") VALUES (E'blocked', E'');
INSERT INTO "public"."user_status"("name", "description") VALUES (E'archived', E'');

-- user_type
INSERT INTO "public"."user_type"("name", "description") VALUES (E'patient', E'');
INSERT INTO "public"."user_type"("name", "description") VALUES (E'provider', E'');
INSERT INTO "public"."user_type"("name", "description") VALUES (E'caretaker', E'');
INSERT INTO "public"."user_type"("name", "description") VALUES (E'therapist', E'');
INSERT INTO "public"."user_type"("name", "description") VALUES (E'admin', E'');
