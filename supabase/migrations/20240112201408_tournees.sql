create table preparations (
  preparation_id bigint not null,
  jardin_id bigint not null,
  preparation text not null,
  ordre smallint not null
);

alter table preparations alter column preparation_id add generated by default as identity (
  sequence name preparation_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
  cache 1
);

alter table only preparations
  add constraint preparations_pkey primary key (preparation_id);

create table calendriers (
  calendrier_id bigint not null,
  jardin_id bigint not null,
  calendrier text not null
);

alter table calendriers alter column calendrier_id add generated by default as identity (
  sequence name calendrier_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
  cache 1
);

alter table only calendriers
  add constraint calendriers_pkey primary key (calendrier_id);

create table tournees (
  tournee_id bigint not null,
  jardin_id bigint not null,
  tournee text,
  preparation_id bigint,
  calendrier_id bigint,
  ordre smallint,
  couleur text
);

alter table only tournees
  add constraint tournees_jardin_id_fkey foreign key (jardin_id) references jardins(jardin_id);

alter table only tournees
  add constraint tournees_preparation_id_fkey foreign key (preparation_id) references preparations(preparation_id);

alter table only tournees
  add constraint tournees_pkey primary key (tournee_id);

create table distributions (
  distribution_id bigint not null,
  jardin_id bigint not null,
  tournee_id bigint not null,
  depot_id bigint not null,
  ordre smallint
);

alter table distributions alter column distribution_id add generated by default as identity (
  sequence name distribution_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
  cache 1
);

alter table only distributions
  add constraint distributions_pkey primary key (distribution_id);

alter table distributions
  add constraint distributions_tournee_id_fkey foreign key (tournee_id) references tournees(tournee_id) not valid;

alter table distributions
  add constraint "distributions_depot_id_fkey" foreign key (depot_id) references depots(depot_id) not valid;

alter table distributions
  add constraint "distributions_jardin_id_fkey" foreign key (jardin_id) references jardins(jardin_id) on update cascade not valid;
