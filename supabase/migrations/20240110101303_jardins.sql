create table jardins (
  jardin_id bigint not null,
  jardin text,
  adresse_id bigint,
  tva text,
  contact_id bigint
);

alter table jardins alter column jardin_id add generated by default as identity (
  sequence name jardin_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
  cache 1
);

alter table only jardins
  add constraint jardins_pkey primary key (jardin_id);

-- Adresses

create extension postgis schema extensions;

create table adresses (
  adresse_id bigint not null,
  jardin_id bigint,
  adresse text,
  codepostal text,
  ville text,
  localisation extensions.geometry
);

alter table adresses alter column adresse_id add generated by default as identity (
  sequence name adresse_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
  cache 1
);

alter table only adresses
  add constraint adresses_pkey primary key (adresse_id);

-- Adresses

create table contacts (
  contact_id bigint not null,
  jardin_id bigint,
  contact text,
  telephone text,
  email text
);

alter table contacts alter column contact_id add generated by default as identity (
  sequence name contact_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
  cache 1
);

alter table only contacts
  add constraint contacts_pkey primary key (contact_id);