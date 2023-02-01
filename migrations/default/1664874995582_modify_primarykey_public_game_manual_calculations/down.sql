alter table "public"."game_manual_calculations" drop constraint "game_manual_calculations_pkey";
alter table "public"."game_manual_calculations"
    add constraint "game_manual_calculations_pkey"
    primary key ("promptId", "gameId");
