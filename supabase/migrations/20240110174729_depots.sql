create table depots (
  depot_id bigint not null,
  jardin_id bigint not null,
  depot text not null,
  adresse_id bigint,
  contact_id bigint,
  capacite integer default 0
);

alter table depots alter column depot_id add generated by default as identity (
  sequence name depot_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
  cache 1
);

alter table only depots
    add constraint depots_pkey primary key (depot_id);

alter table only depots
  add constraint depots_jardin_id_fkey foreign key (jardin_id) references jardins(jardin_id) on delete cascade;