CREATE TYPE status_enum AS ENUM ('success', 'fail');

CREATE TYPE transaction_status_enum AS ENUM ('failed', 'success');

CREATE TYPE direction_enum AS ENUM ('outgoing', 'incoming');

CREATE TYPE transaction_category_enum AS ENUM (
  'payment', 'transfer', 'bank_deposit', 'bank_withdrawal', 
  'momo_deposit', 'momo_withdrawal', 'Airtime', 'electricity'
);

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
  "status" status_enum,
  "message" text
);

CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "full_name" varchar,
  "number" varchar(13) UNIQUE,
  "ends_in" varchar(3),
  "payment_code" varchar,
  "inferred_at" timestamp
);

CREATE TABLE "transactions" (
  "id" uuid PRIMARY KEY,
  "tx_id" varchar,
  "recpt" uuid,
  "sender" uuid,
  "date" timestamp,
  "amount" decimal,
  "status" transaction_status_enum,
  "fee" decimal,
  "direction" direction_enum,
  "new_balance" decimal,
  "transaction_category" transaction_category_enum,
  "sms_id" uuid UNIQUE NOT NULL
);


ALTER TABLE "transactions" ADD FOREIGN KEY ("sms_id") REFERENCES "sms" ("id");

ALTER TABLE "transactions" ADD CONSTRAINT "users" FOREIGN KEY ("recpt") REFERENCES "users" ("id");

ALTER TABLE "transactions" ADD CONSTRAINT "users" FOREIGN KEY ("sender") REFERENCES "users" ("id");
