CREATE TABLE tokens (
  id SERIAL PRIMARY KEY NOT NULL,
  users_id int NOT NULL,
  token varchar(100) NOT NULL,
  refresh_token varchar(100) NOT NULL,
  created_at timestamp NOT NULL,
  updated_at timestamp NOT NULL
);
