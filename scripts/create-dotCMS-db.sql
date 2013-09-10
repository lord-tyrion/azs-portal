-- Database: "dotCMS"

-- DROP DATABASE "dotCMS";

CREATE DATABASE "dotCMS"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'hu_HU.UTF-8'
       LC_CTYPE = 'hu_HU.UTF-8'
       CONNECTION LIMIT = -1;

ALTER DATABASE "dotCMS" SET datestyle TO "ISO, DMY";