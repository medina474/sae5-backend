create table plannings (
  planning_id bigint not null,
  frequence_id bigint not null,
  calendrier_id bigint,
  jour date,
  quantite smallint
);

alter table plannings alter column planning_id add generated by default as identity (
  sequence name plannings_planning_id_seq
  start with 1
  increment by 1
  no minvalue
  no maxvalue
  cache 1
);

alter table only plannings
  add constraint plannings_calendrier_id_fkey
  foreign key (calendrier_id) references calendriers(calendrier_id);

alter table only plannings
  add constraint plannings_pkey
  primary key (planning_id);

alter table plannings
  add constraint plannings_frequence_id_fkey
  foreign key (frequence_id) references frequences(frequence_id) not valid;
