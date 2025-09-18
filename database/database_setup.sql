CREATE TABLE "sms" (
  "id" uuid PRIMARY KEY,
  "protocol" varchar,
  "address" varchar,
  "date" timestamp,
  "type" varchar,
  "subject" varchar,
  "body" text,
  "toa" varchar,
  "sc_toa" varchar,
  "service_center" varchar,
  "read" varchar,
  "status" varchar,
  "locked" varchar,
  "date_sent" timestamp,
  "sub_id" varchar,
  "readable_date" varchar,
  "contact_name" varchar
);

CREATE TABLE "system_logs" (
  "id" uuid PRIMARY KEY,
  "created_at" timestamp,
  "status" enum(success,fail),
  "message" text
);

CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "full_name" varchar,
  "number" varchar(13) UNIQUE,
  "ends_in" varchar[3],
  "payment_code" varchar,
  "inferred_at" timestamp
);

CREATE TABLE "transactions" (
  "id" uuid,
  "tx_id" varchar,
  "recpt" uuid,
  "sender" uuid,
  "date" timestamp,
  "amount" decimal,
  "status" enum(failed,sucessful),
  "fee" decimal,
  "direction" enum(outgoing,incoming),
  "new_balance" decimal,
  "transaction_category" "enum(payment,transfer,bank_deposit,bank_withdrawal,momo_deposit,momo_withdrawal,Airtime,electricity)",
  "sms_id" uuid UNIQUE NOT NULL
);

ALTER TABLE "transactions" ADD FOREIGN KEY ("sms_id") REFERENCES "sms" ("id");

ALTER TABLE "transactions" ADD CONSTRAINT "users" FOREIGN KEY ("recpt") REFERENCES "users" ("id");

ALTER TABLE "transactions" ADD CONSTRAINT "users" FOREIGN KEY ("sender") REFERENCES "users" ("id");
