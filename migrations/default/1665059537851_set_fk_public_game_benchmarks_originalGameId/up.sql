alter table "public"."game_benchmarks"
  add constraint "game_benchmarks_originalGameId_fkey"
  foreign key ("originalGameId")
  references "public"."game"
  ("id") on update restrict on delete restrict;
