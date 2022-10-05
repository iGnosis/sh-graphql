alter table "public"."game_benchmarks"
  add constraint "game_benchmarks_gameId_fkey2"
  foreign key ("gameId")
  references "public"."game"
  ("id") on update restrict on delete restrict;
