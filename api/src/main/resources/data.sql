truncate ustensil cascade;
truncate ingredient cascade;
truncate ingredientCategory cascade;
truncate category_ingredients cascade;
truncate recette cascade;
truncate recette_ingredientlines cascade;
truncate ingredientline cascade;
truncate users cascade;
truncate steptype cascade;
truncate steptype_ustensils cascade;
truncate step cascade;

insert into users (id,password,username) values (1,'dazdazd','user1');
insert into users (id,password,username) values (2,'dazdazd','user2');

insert into ustensil (id,nom) values (1,'Fourchette');
insert into ustensil (id,nom) values (2,'Louche');
insert into ustensil (id,nom) values (3,'Poele');
insert into ustensil (id,nom) values (4,'Couteau');

insert into ingredient (id,isvegan,name) values (1,true,'Carotte');
insert into ingredient (id,isvegan,name) values (2,false,'Steak haché');

insert into ingredientCategory (id,name) values (1,'Viande');
insert into ingredientCategory (id,name) values (2,'Vegan');

insert into category_ingredients (category_id,ingredients_id) values (1,1);
insert into category_ingredients (category_id,ingredients_id) values (2,2);



insert into steptype (id,name) values (1,'Cuire');
insert into steptype (id,name) values (2,'Couper');

insert into steptype_ustensils (steptype_id,ustensils_id) values (1,3);
insert into steptype_ustensils (steptype_id,ustensils_id) values (2,4);


insert into recette (id,nom,createur_id) values (1,'Steak avec carotte',2);

insert into ingredientline(id,quantity,ingredient_id) values (1,2,1);
insert into ingredientline(id,quantity,ingredient_id) values (2,2,2);


insert into recette_ingredientlines (recette_id,ingredientlines_id) values (1,1);
insert into recette_ingredientlines (recette_id,ingredientlines_id) values (1,2);


insert into step (id,duration,stepname,stepnumber,ingredientline_id,steptype_id) values (1,2,'Couper les carottes en cube',1,1,2);
insert into step (id,duration,stepname,stepnumber,ingredientline_id,steptype_id) values (2,2,'Cuire le steak à point',2,2,1);

insert into recette_steps (recette_id,steps_id) values (1,1);
insert into recette_steps (recette_id,steps_id) values (1,2);
