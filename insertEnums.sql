-- activity_difficulty
INSERT INTO activity_difficulty(name, description) VALUES ('Easy', '');
INSERT INTO activity_difficulty(name, description) VALUES ('Moderate', '');
INSERT INTO activity_difficulty(name, description) VALUES ('Hard', '');

-- genre
INSERT INTO genre(name, description) VALUES ('classical', '');
INSERT INTO genre(name, description) VALUES ('jazz', '');

-- medical_condition
INSERT INTO medical_condition(name, description) VALUES ('parkinson', 'Parkinson''s');
INSERT INTO medical_condition(name, description) VALUES ('huntingtons', 'Huntington''s');
INSERT INTO medical_condition(name, description) VALUES ('alzheimers', 'Alzheimer''s');

-- provider_type
INSERT INTO provider_type(name, description) VALUES ('clinic', '');
INSERT INTO provider_type(name, description) VALUES ('hospital', '');

-- user_relation_type
INSERT INTO user_relation_type(name, description) VALUES ('caretaker', '');
INSERT INTO user_relation_type(name, description) VALUES ('therapist', '');

-- user_status
INSERT INTO user_status(name, description) VALUES ('active', '');
INSERT INTO user_status(name, description) VALUES ('inactive', '');
INSERT INTO user_status(name, description) VALUES ('dormant', '');
INSERT INTO user_status(name, description) VALUES ('blocked', '');
INSERT INTO user_status(name, description) VALUES ('archived', '');

-- user_type
INSERT INTO user_type(name, description) VALUES ('patient', '');
INSERT INTO user_type(name, description) VALUES ('provider', '');
INSERT INTO user_type(name, description) VALUES ('caretaker', '');
INSERT INTO user_type(name, description) VALUES ('therapist', '');
INSERT INTO user_type(name, description) VALUES ('admin', '');
