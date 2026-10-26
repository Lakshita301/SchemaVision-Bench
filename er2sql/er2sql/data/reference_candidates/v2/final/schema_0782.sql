-- Source: https://github.com/stgpetrovic/stacuist.com/blob/fec03131ade6514ea0692ee87fdf278f07dbe4d7/db/db.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

create table recipe (
  id integer primary key autoincrement,
  version integer not null,
  name text not null,
  author text not null,
  text text not null,
  ingredients text not null
);

create table tag (
  id integer primary key autoincrement,
  version integer not null,
  name text not null
);

create table recipe_tags (
  recipe_id integer not null,
  tag_id integer not null,
  primary key (recipe_id, tag_id),
  constraint fk_recipe foreign key (recipe_id) references recipe (id) on delete cascade deferrable initially deferred,
  constraint fk_tag foreign key (tag_id) references tag (id) on delete cascade deferrable initially deferred
);

