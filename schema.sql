CREATE TABLE "Redfin_Data_Table" (
    "house_price" INTEGER   NOT NULL,
    "zip_code" INTEGER   NOT NULL,
    "house_address" VARCHAR(100)   NOT NULL,
    "beds-" FLOAT   NOT NULL,
    "baths" FLOAT   NOT NULL,
    "house_link" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_Redfin_Data_Table" PRIMARY KEY (
        "house_address"
     )
);


CREATE TABLE "Zip_Code" (
    "zip_code" INTEGER NOT NULL,
    "city" VARCHAR(20)   NOT NULL,
    "state" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_Zip_Code" PRIMARY KEY (
        "zip_code"
     )
);

CREATE TABLE "Crime_Code_Table" (
    "mo_code" INTEGER NOT NULL,
    "mo_description" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_Crime_Code_Table" PRIMARY KEY (
        "mo_code"
     )
);

CREATE TABLE "Crime_detail_table" (
    "ID" SERIAL   NOT NULL,
    "zip_code" INTEGER   NOT NULL,
    "mo_code_list" VARCHAR(50),
    "mo_description_list" VARCHAR(400)   NOT NULL,
    "charge_of_violations" INTEGER   NOT NULL,
    "date_occurred" Date   NOT NULL,
    "date_reported" Date   NOT NULL,
    "area_name" VARCHAR(50)   NOT NULL,
    "latitude" FLOAT   NOT NULL,
    "longitude" FLOAT   NOT NULL,
    CONSTRAINT "pk_Crime_detail_table" PRIMARY KEY (
        "ID"
     )
);
SELECT * FROM "Crime_detail_table"

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


ALTER TABLE "Crime_detail_table" ADD CONSTRAINT "fk_Crime_detail_table_zip_code" FOREIGN KEY("zip_code")
REFERENCES "Redfin_Data_Table" ("zip_code");