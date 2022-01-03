CREATE TABLE "public.salesperson" (
	"first_name" TEXT(255) NOT NULL,
	"last_name" TEXT(255) NOT NULL,
	"email" varchar(255) NOT NULL,
	"salesperson_id" serial NOT NULL,
	"phone_number" DECIMAL NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sales_invoice" (
	"transaction_id" serial NOT NULL,
	"price" DECIMAL NOT NULL,
	"seller" varchar(255) NOT NULL,
	"buyer" varchar(255) NOT NULL,
	"sold_vehicle" varchar(255) NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.car" (
	"vin_number" varchar(255) NOT NULL,
	"make" TEXT NOT NULL,
	"model" TEXT NOT NULL,
	"year" DECIMAL NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customer" (
	"first_name" TEXT NOT NULL,
	"last_name" TEXT NOT NULL,
	"email" varchar(255) NOT NULL,
	"customer_id" serial NOT NULL,
	"phone_number" DECIMAL NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.mechanic" (
	"first_name" TEXT(255) NOT NULL,
	"last_name" TEXT(255) NOT NULL,
	"email" varchar(255) NOT NULL,
	"mechanic_id" serial NOT NULL,
	"phone_number" DECIMAL NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.service_ticket" (
	"service_ticket_id" serial NOT NULL,
	"mechanic" varchar(255) NOT NULL,
	"vehicle_owner" varchar(255) NOT NULL,
	"repaired_vehicle" varchar(255) NOT NULL,
	"parts_used" varchar(255) NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.parts" (
	"parts_id" serial NOT NULL,
	"part_description" varchar(255) NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sales_list" (
	"sales_list" DECIMAL NOT NULL
) WITH (
  OIDS=FALSE
);




ALTER TABLE "sales_invoice" ADD CONSTRAINT "sales_invoice_fk0" FOREIGN KEY ("seller") REFERENCES "salesperson"("salesperson_id");
ALTER TABLE "sales_invoice" ADD CONSTRAINT "sales_invoice_fk1" FOREIGN KEY ("buyer") REFERENCES "customer"("customer_id");
ALTER TABLE "sales_invoice" ADD CONSTRAINT "sales_invoice_fk2" FOREIGN KEY ("sold_vehicle") REFERENCES "car"("vin_number");




ALTER TABLE "service_ticket" ADD CONSTRAINT "service_ticket_fk0" FOREIGN KEY ("mechanic") REFERENCES "salesperson"("salesperson_id");
ALTER TABLE "service_ticket" ADD CONSTRAINT "service_ticket_fk1" FOREIGN KEY ("vehicle_owner") REFERENCES "customer"("customer_id");
ALTER TABLE "service_ticket" ADD CONSTRAINT "service_ticket_fk2" FOREIGN KEY ("repaired_vehicle") REFERENCES "car"("vin_number");
ALTER TABLE "service_ticket" ADD CONSTRAINT "service_ticket_fk3" FOREIGN KEY ("parts_used") REFERENCES "parts"("parts_id");


ALTER TABLE "sales_list" ADD CONSTRAINT "sales_list_fk0" FOREIGN KEY ("sales_list") REFERENCES "sales_invoice"("transaction_id");









