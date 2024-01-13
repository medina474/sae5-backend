create table fournisseurs (
  fournisseur_id bigint not null,
  jardin_id bigint not null,
  fournisseur text,
  tva text,
  adresse_id bigint
);

alter table fournisseurs alter column fournisseur_id add generated by default as identity (
  sequence name fournisseur_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
  cache 1
);

alter table only fournisseurs
  add constraint fournisseurs_pkey primary key (fournisseur_id);

alter table only fournisseurs
  add constraint fournisseurs_jardin_id_fkey foreign key (jardin_id) references jardins(jardin_id) on delete cascade;