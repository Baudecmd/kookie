truncate ustensil cascade;
truncate ingredient cascade;
truncate ingredientCategory cascade;
truncate category_ingredients cascade;


insert into ustensil (id,nom) values (1,'Fourchette');
insert into ustensil (id,nom) values (2,'Louche');
insert into ustensil (id,nom) values (3,'Poele');

insert into ingredient (id,isvegan,name) values (1,true,'Carotte');
insert into ingredient (id,isvegan,name) values (2,false,'Steak haché');

insert into ingredientCategory (id,name) values (1,'Viande');
insert into ingredientCategory (id,name) values (2,'Vegan');

insert into category_ingredients (category_id,ingredients_id) values (1,1);
insert into category_ingredients (category_id,ingredients_id) values (2,2);


