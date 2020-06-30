-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/e7xd0m
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Redfin_Data_Table" (
    "house_price" INTEGER   NOT NULL,
    "zip_code" INTEGER   NOT NULL,
    "house_address" VARCHAR(100)   NOT NULL,
    "beds-" INTEGER   NOT NULL,
    "baths" INTEGER   NOT NULL,
    "house_link" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_Redfin_Data_Table" PRIMARY KEY (
        "house_address"
     )
);

CREATE TABLE "Zip_Code" (
    "zip_code" -   NOT NULL,
    "city" VARCHAR(20)   NOT NULL,
    "state" INTEGER   NOT NULL,
    CONSTRAINT "pk_Zip_Code" PRIMARY KEY (
        "zip_code"
     )
);

CREATE TABLE "Crime_Code_Table" (
    "mo_code" -   NOT NULL,
    "mo_description" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Crime_Code_Table" PRIMARY KEY (
        "mo_code"
     )
);

CREATE TABLE "Crime_detail_table" (
    "ID" SERIAL   NOT NULL,
    "zip_code" INTEGER   NOT NULL,
    "mo_code" INTEGER   NOT NULL,
    "mo_description" VARCHAR(100)   NOT NULL,
    "charge_of_violations" INTEGER   NOT NULL,
    "date_occurred" INTEGER   NOT NULL,
    "date_reported" INTEGER   NOT NULL,
    "area_name" VARCHAR(50)   NOT NULL,
    "latitude" INTEGER   NOT NULL,
    "longitude" INTEGER   NOT NULL,
    CONSTRAINT "pk_Crime_detail_table" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Crime_summary_table" (
    "zip_code" INTEGER   NOT NULL,
    "count_of_crimes" INTEGER   NOT NULL,
    CONSTRAINT "pk_Crime_summary_table" PRIMARY KEY (
        "zip_code"
     )
);

ALTER TABLE "Redfin_Data_Table" ADD CONSTRAINT "fk_Redfin_Data_Table_zip_code" FOREIGN KEY("zip_code")
REFERENCES "Crime_summary_table" ("zip_code");

ALTER TABLE "Zip_Code" ADD CONSTRAINT "fk_Zip_Code_zip_code" FOREIGN KEY("zip_code")
REFERENCES "Crime_summary_table" ("zip_code");

ALTER TABLE "Crime_Code_Table" ADD CONSTRAINT "fk_Crime_Code_Table_mo_code" FOREIGN KEY("mo_code")
REFERENCES "Crime_detail_table" ("mo_code");

ALTER TABLE "Crime_detail_table" ADD CONSTRAINT "fk_Crime_detail_table_zip_code" FOREIGN KEY("zip_code")
REFERENCES "Redfin_Data_Table" ("zip_code");

