SET check_function_bodies = false;
CREATE FUNCTION public."set_current_timestamp_updatedAt"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updatedAt" = NOW();
  RETURN _new;
END;
$$;
CREATE TABLE public.activity (
    name text NOT NULL,
    details jsonb NOT NULL,
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    duration integer DEFAULT 0 NOT NULL,
    difficulty text DEFAULT 'Easy'::text NOT NULL
);
COMMENT ON TABLE public.activity IS 'Available Exercises';
CREATE TABLE public.activity_difficulty (
    name text NOT NULL,
    description text NOT NULL
);
CREATE TABLE public.careplan (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    details jsonb,
    provider uuid NOT NULL,
    tags jsonb,
    "createdBy" uuid NOT NULL,
    "estimatedDuration" integer DEFAULT 0 NOT NULL,
    "medicalConditions" jsonb DEFAULT '[]'::jsonb NOT NULL,
    "difficultyLevel" text DEFAULT 'beginner'::text NOT NULL,
    description text DEFAULT ' '::text NOT NULL,
    options jsonb
);
CREATE TABLE public.careplan_activity (
    careplan uuid NOT NULL,
    activity uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    provider uuid NOT NULL,
    reps integer DEFAULT 1 NOT NULL,
    "createdBy" uuid NOT NULL,
    options jsonb
);
COMMENT ON TABLE public.careplan_activity IS 'M2M table for saving relation between activities and careplans';
CREATE TABLE public.events (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "user" uuid NOT NULL,
    patient uuid NOT NULL,
    session uuid NOT NULL,
    activity uuid,
    task_id uuid,
    task_name text,
    event_type text NOT NULL,
    created_at bigint NOT NULL,
    score double precision DEFAULT '0'::double precision NOT NULL,
    attempt_id uuid
);
CREATE TABLE public.genre (
    name text NOT NULL,
    description text NOT NULL
);
COMMENT ON TABLE public.genre IS 'Muscial Genres';
CREATE TABLE public.medical_condition (
    name text NOT NULL,
    description text NOT NULL
);
CREATE TABLE public.patient (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    provider uuid NOT NULL,
    identifier text NOT NULL,
    "medicalConditions" jsonb NOT NULL,
    "preferredGenres" jsonb NOT NULL,
    "primaryTherapist" uuid NOT NULL,
    "onboardedBy" uuid NOT NULL
);
CREATE TABLE public.patient_careplan (
    patient uuid NOT NULL,
    careplan uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    provider uuid NOT NULL,
    "createdBy" uuid NOT NULL
);
CREATE TABLE public.patient_notes (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    provider uuid NOT NULL,
    author uuid NOT NULL,
    patient uuid NOT NULL,
    note text NOT NULL
);
CREATE TABLE public.provider (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    type text NOT NULL
);
COMMENT ON TABLE public.provider IS 'Hospital or Clinic';
CREATE TABLE public.provider_type (
    name text NOT NULL,
    description text NOT NULL
);
COMMENT ON TABLE public.provider_type IS 'Types of providers';
CREATE TABLE public.session (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "endedAt" timestamp with time zone,
    patient uuid NOT NULL,
    analytics jsonb,
    provider uuid,
    careplan uuid NOT NULL,
    "preSessionMood" text,
    "postSessionMood" text,
    genre text,
    state jsonb
);
CREATE TABLE public.subscription (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    provider uuid NOT NULL,
    "user" uuid NOT NULL,
    expiry timestamp with time zone NOT NULL
);
COMMENT ON TABLE public.subscription IS 'Patient subscriptions';
CREATE TABLE public."user" (
    email text,
    password text,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "lastActive" timestamp with time zone DEFAULT now() NOT NULL,
    "firstName" text,
    "lastName" text,
    type text,
    status text DEFAULT 'invited'::text NOT NULL,
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    provider uuid NOT NULL,
    "resetPasswordCode" text,
    "resetPasswordExpiry" timestamp with time zone
);
COMMENT ON TABLE public."user" IS 'Patient | Therapist | Admins';
CREATE TABLE public.user_medical_condition (
    "user" uuid NOT NULL,
    medical_condition text NOT NULL
);
CREATE TABLE public.user_preferred_genre (
    "user" uuid NOT NULL,
    genre text NOT NULL
);
COMMENT ON TABLE public.user_preferred_genre IS 'M2M table for saving User''s favorite Genres';
CREATE TABLE public.user_profile (
    "user" uuid NOT NULL,
    dob date,
    gender text,
    "preferredGenre" text,
    "onboardedOn" timestamp with time zone DEFAULT now(),
    phone text,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "medicalConditions" jsonb,
    "otherConditions" jsonb,
    provider uuid NOT NULL
);
CREATE TABLE public.user_relation (
    "from" uuid NOT NULL,
    "to" uuid NOT NULL,
    relation text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);
COMMENT ON TABLE public.user_relation IS 'M2M for users';
CREATE TABLE public.user_relation_type (
    name text NOT NULL,
    description text NOT NULL
);
CREATE TABLE public.user_status (
    name text NOT NULL,
    description text NOT NULL
);
CREATE TABLE public.user_type (
    name text NOT NULL,
    description text NOT NULL
);
ALTER TABLE ONLY public.activity_difficulty
    ADD CONSTRAINT activity_difficulty_pkey PRIMARY KEY (name);
ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.careplan
    ADD CONSTRAINT careplan_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (name);
ALTER TABLE ONLY public.medical_condition
    ADD CONSTRAINT medical_condition_pkey PRIMARY KEY (name);
ALTER TABLE ONLY public.patient_careplan
    ADD CONSTRAINT patient_careplan_pkey PRIMARY KEY (patient, careplan);
ALTER TABLE ONLY public.patient_notes
    ADD CONSTRAINT patient_notes_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_provider_identifier_key UNIQUE (provider, identifier);
ALTER TABLE ONLY public.careplan_activity
    ADD CONSTRAINT program_activity_pkey PRIMARY KEY (careplan, activity);
ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.provider_type
    ADD CONSTRAINT provider_type_pkey PRIMARY KEY (name);
ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.user_medical_condition
    ADD CONSTRAINT user_medical_condition_pkey PRIMARY KEY ("user", medical_condition);
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.user_preferred_genre
    ADD CONSTRAINT user_preferred_genre_pkey PRIMARY KEY ("user", genre);
ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY ("user");
ALTER TABLE ONLY public.user_relation
    ADD CONSTRAINT user_relation_pkey PRIMARY KEY ("from", "to");
ALTER TABLE ONLY public.user_relation_type
    ADD CONSTRAINT user_relation_type_pkey PRIMARY KEY (name);
ALTER TABLE ONLY public.user_status
    ADD CONSTRAINT user_status_pkey PRIMARY KEY (name);
ALTER TABLE ONLY public.user_type
    ADD CONSTRAINT user_types_pkey PRIMARY KEY (name);
CREATE TRIGGER "set_public_activity_updatedAt" BEFORE UPDATE ON public.activity FOR EACH ROW EXECUTE PROCEDURE public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_activity_updatedAt" ON public.activity IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_careplan_updatedAt" BEFORE UPDATE ON public.careplan FOR EACH ROW EXECUTE PROCEDURE public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_careplan_updatedAt" ON public.careplan IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_patient_notes_updatedAt" BEFORE UPDATE ON public.patient_notes FOR EACH ROW EXECUTE PROCEDURE public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_patient_notes_updatedAt" ON public.patient_notes IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_patient_updatedAt" BEFORE UPDATE ON public.patient FOR EACH ROW EXECUTE PROCEDURE public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_patient_updatedAt" ON public.patient IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_provider_updatedAt" BEFORE UPDATE ON public.provider FOR EACH ROW EXECUTE PROCEDURE public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_provider_updatedAt" ON public.provider IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_session_updatedAt" BEFORE UPDATE ON public.session FOR EACH ROW EXECUTE PROCEDURE public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_session_updatedAt" ON public.session IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_subscription_updatedAt" BEFORE UPDATE ON public.subscription FOR EACH ROW EXECUTE PROCEDURE public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_subscription_updatedAt" ON public.subscription IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_user_profile_updatedAt" BEFORE UPDATE ON public.user_profile FOR EACH ROW EXECUTE PROCEDURE public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_user_profile_updatedAt" ON public.user_profile IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE TRIGGER "set_public_users_updatedAt" BEFORE UPDATE ON public."user" FOR EACH ROW EXECUTE PROCEDURE public."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_users_updatedAt" ON public."user" IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_difficulty_fkey FOREIGN KEY (difficulty) REFERENCES public.activity_difficulty(name) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.careplan_activity
    ADD CONSTRAINT careplan_activity_careplan_fkey FOREIGN KEY (careplan) REFERENCES public.careplan(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.careplan_activity
    ADD CONSTRAINT careplan_activity_provider_fkey FOREIGN KEY (provider) REFERENCES public.provider(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.careplan
    ADD CONSTRAINT "careplan_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.careplan
    ADD CONSTRAINT careplan_provider_fkey FOREIGN KEY (provider) REFERENCES public.provider(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_activity_fkey FOREIGN KEY (activity) REFERENCES public.activity(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_patient_fkey FOREIGN KEY (patient) REFERENCES public.patient(id) ON UPDATE RESTRICT ON DELETE CASCADE;
ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_session_fkey FOREIGN KEY (session) REFERENCES public.session(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_user_fkey FOREIGN KEY ("user") REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.patient_careplan
    ADD CONSTRAINT patient_careplan_careplan_fkey FOREIGN KEY (careplan) REFERENCES public.careplan(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.patient_careplan
    ADD CONSTRAINT patient_careplan_patient_fkey FOREIGN KEY (patient) REFERENCES public.patient(id) ON UPDATE RESTRICT ON DELETE CASCADE;
ALTER TABLE ONLY public.patient_notes
    ADD CONSTRAINT patient_notes_author_fkey FOREIGN KEY (author) REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.patient_notes
    ADD CONSTRAINT patient_notes_patient_fkey FOREIGN KEY (patient) REFERENCES public.patient(id) ON UPDATE RESTRICT ON DELETE CASCADE;
ALTER TABLE ONLY public.patient_notes
    ADD CONSTRAINT patient_notes_provider_fkey FOREIGN KEY (provider) REFERENCES public.provider(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.patient
    ADD CONSTRAINT "patient_onboardedBy_fkey" FOREIGN KEY ("onboardedBy") REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.patient
    ADD CONSTRAINT "patient_primaryTherapist_fkey" FOREIGN KEY ("primaryTherapist") REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_provider_fkey FOREIGN KEY (provider) REFERENCES public.provider(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.careplan_activity
    ADD CONSTRAINT program_activity_activity_fkey FOREIGN KEY (activity) REFERENCES public.activity(id);
ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_type_fkey FOREIGN KEY (type) REFERENCES public.provider_type(name) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_careplan_fkey FOREIGN KEY (careplan) REFERENCES public.careplan(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_patient_fkey FOREIGN KEY (patient) REFERENCES public.patient(id) ON UPDATE RESTRICT ON DELETE CASCADE;
ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_provider_fkey FOREIGN KEY (provider) REFERENCES public.provider(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_provider_fkey FOREIGN KEY (provider) REFERENCES public.provider(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_user_fkey FOREIGN KEY ("user") REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.user_medical_condition
    ADD CONSTRAINT user_medical_condition_medical_condition_fkey FOREIGN KEY (medical_condition) REFERENCES public.medical_condition(name) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.user_medical_condition
    ADD CONSTRAINT user_medical_condition_user_fkey FOREIGN KEY ("user") REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.user_preferred_genre
    ADD CONSTRAINT user_preferred_genre_genre_fkey FOREIGN KEY (genre) REFERENCES public.genre(name) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.user_preferred_genre
    ADD CONSTRAINT user_preferred_genre_user_fkey FOREIGN KEY ("user") REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT "user_profile_preferredGenre_fkey" FOREIGN KEY ("preferredGenre") REFERENCES public.genre(name) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_provider_fkey FOREIGN KEY (provider) REFERENCES public.provider(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_user_fkey FOREIGN KEY ("user") REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_provider_fkey FOREIGN KEY (provider) REFERENCES public.provider(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.user_relation
    ADD CONSTRAINT user_relation_from_fkey FOREIGN KEY ("from") REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.user_relation
    ADD CONSTRAINT user_relation_relation_fkey FOREIGN KEY (relation) REFERENCES public.user_relation_type(name) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.user_relation
    ADD CONSTRAINT user_relation_to_fkey FOREIGN KEY ("to") REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_status_fkey FOREIGN KEY (status) REFERENCES public.user_status(name) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_type_fkey FOREIGN KEY (type) REFERENCES public.user_type(name) ON UPDATE RESTRICT ON DELETE RESTRICT;
