-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE TABLE public.audit (
--     id uuid DEFAULT public.gen_random_uuid() NOT NULL,
--     "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
--     "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
--     "operationType" text NOT NULL,
--     "healthRecordId" uuid NOT NULL,
--     "newRecord" jsonb,
--     "oldRecord" uuid,
--     "organizationId" uuid,
--     "modifiedByUser" uuid,
--     "userRole" text
-- );