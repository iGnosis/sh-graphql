alter table "public"."payment_methods"
  add constraint "payment_methods_customerId_fkey"
  foreign key ("customerId")
  references "public"."patient"
  ("customerId") on update restrict on delete restrict;
