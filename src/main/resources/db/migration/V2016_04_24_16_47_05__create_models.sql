CREATE TABLE company (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE industry (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE company_size (
  id SERIAL PRIMARY KEY,
  size_range TEXT NOT NULL,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE company_detail (
  id SERIAL PRIMARY KEY,
  company INTEGER REFERENCES company,
  industry INTEGER REFERENCES industry,
  company_size INTEGER REFERENCES company_size,
  inception_date DATE,
  description TEXT,
  mission VARCHAR(280) NOT NULL,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE company_address (
  id SERIAL PRIMARY KEY,
  company INTEGER REFERENCES company,
  address_line_1 TEXT,
  address_line_2 TEXT,
  address_line_3 TEXT,
  address_line_4 TEXT,
  county_sublocality TEXT,
  city_town_district TEXT,
  state_province_region_territory TEXT,
  postal_code TEXT,
  country TEXT,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE file_type (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE company_marketing_collateral (
  id SERIAL PRIMARY KEY,
  company INTEGER REFERENCES company,
  name TEXT,
  description TEXT,
  file_type INTEGER REFERENCES file_type,
  file_location TEXT,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE company_kpi_type (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  kpi_suffix TEXT,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE company_financial_kpi (
  id SERIAL PRIMARY KEY,
  company INTEGER REFERENCES company,
  kpi_type INTEGER REFERENCES company_kpi_type,
  kpi_value TEXT
);

CREATE TABLE document_type (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE company_document (
  id SERIAL PRIMARY KEY,
  company INTEGER REFERENCES company,
  name TEXT,
  description TEXT,
  document_type INTEGER REFERENCES document_type,
  file_type INTEGER REFERENCES file_type,
  file_location TEXT,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE investor_type (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE site_user_role (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE site_user (
  id SERIAL PRIMARY KEY,
  email TEXT,
  password TEXT,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE site_user_company_role_type (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE site_user_company_role (
  id SERIAL PRIMARY KEY,
  site_user INTEGER REFERENCES site_user,
  site_user_company_role_type INTEGER REFERENCES site_user_company_role_type,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE currency_type (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE site_user_occupation (
  id SERIAL PRIMARY KEY,
  site_user INTEGER REFERENCES site_user,
  occupation TEXT,
  company_name TEXT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  annual_salary DECIMAL,
  currency_type INTEGER REFERENCES currency_type,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE qualification_type (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE site_user_qualification (
  id SERIAL PRIMARY KEY,
  site_user INTEGER REFERENCES site_user,
  qualification_type INTEGER REFERENCES qualification_type,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE site_user_detail (
  id SERIAL PRIMARY KEY,
  site_user INTEGER REFERENCES site_user,
  investor_type INTEGER REFERENCES investor_type,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE investment_pool (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  amount DECIMAL NOT NULL,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE investment_type (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE company_investment (
  id SERIAL,
  name TEXT NOT NULL,
  description TEXT,
  investment_type INTEGER REFERENCES investment_type,
  investment_pool INTEGER REFERENCES investment_pool,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE investment (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  investor INTEGER REFERENCES site_user,
  investment_pool INTEGER REFERENCES investment_pool,
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);