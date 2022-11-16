alter table "public"."auth"
    add constraint "auth_pkey"
    primary key ("patient", "staff");
