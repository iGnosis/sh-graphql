alter table "public"."invite_user" drop constraint "invite_user_pkey";
alter table "public"."invite_user"
    add constraint "invite_user_pkey"
    primary key ("id");
