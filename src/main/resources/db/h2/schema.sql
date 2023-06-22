create table vets (
    id integer generated by default as identity primary key,
    first_name varchar(25),
    last_name varchar(25)
);
create index vets_last_name on vets (last_name);

create table specialties (
    id integer generated by default as identity primary key,
    name varchar(25)
);
create index specialties_name on specialties (name);

create table vet_specialties (
    vet_id integer not null,
    specialty_id integer not null
);
alter table vet_specialties add constraint fk_vet_specialties_vet foreign key (vet_id) references vets (id);
alter table vet_specialties add constraint fk_vet_specialties_specialty foreign key (specialty_id) references specialties (id);

create table pet_types (
    id integer generated by default as identity primary key,
    name varchar(25)
);
create index pet_types_name on pet_types (name);

create table owners (
    id integer generated by default as identity primary key,
    first_name varchar(25),
    last_name varchar(25),
    address varchar(80),
    city varchar(25),
    telephone varchar(20)
);
create index owners_last_name on owners (last_name);

create table pets (
    id integer generated by default as identity primary key,
    name varchar(25),
    birth_date date,
    pet_type_id integer,
    owner_id integer
);
create index pets_name on pets (name);
alter table pets add constraint fk_pets_pet_type foreign key (pet_type_id) references pet_types (id);
alter table pets add constraint fk_pets_owner foreign key (owner_id) references owners (id);

create table visits (
    id integer generated by default as identity primary key,
    pet_id integer,
    visit_date date,
    description varchar(80)
);
create index visits_visit_date on visits (visit_date);
alter table visits add constraint fk_visits_pet foreign key (pet_id) references pets (id);