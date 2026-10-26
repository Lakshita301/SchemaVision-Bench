-- Source: https://github.com/Rinehajb/MealPlanner-Final-TE-Capstone/blob/62b549ba20ddfa76b2a1fad23d2e1b73e63af5a8/java/database/schema.sql?raw=true
-- Tables detected: 9 | FK/REFERENCES mentions: 22

CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE recipes (
	recipe_id serial,
	recipe_name varchar(50) NOT NULL,
	recipe_instructions varchar(1000) NOT NULL,
	recipe_description varchar(1000) NOT NULL,
	CONSTRAINT PK_recipe PRIMARY KEY (recipe_id)
);

CREATE TABLE ingredients (
	user_id int NOT NULL,
	ingredient_id serial,
	ingredient_name varchar(50) NOT NULL,
	CONSTRAINT PK_ingredient PRIMARY KEY (ingredient_id),
	CONSTRAINT FK_user FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE meals (
	user_id int,
	meal_id serial,
	meal_name varchar(50) NOT NULL,
	meal_type int NOT NULL,
	CONSTRAINT PK_meal PRIMARY KEY (meal_id),
	CONSTRAINT FK_usermeal FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT UQ_meal_name UNIQUE(meal_name),
	CONSTRAINT CHK_meal_type CHECK(meal_type<=4)

);

CREATE TABLE mealplan (
	user_id int,
	mealplan_id serial,
	mealplan_name varchar(50) NOT NULL,
	mealplan_day int,
	CONSTRAINT PK_mealplan PRIMARY KEY(mealplan_id),
	CONSTRAINT FK_usermp FOREIGN KEY(user_id) REFERENCES users(user_id),
	CONSTRAINT CHK_mealplan_day CHECK (mealplan_day<=7)
);

CREATE TABLE mealplan_meal (
	meal_id int,
	mealplan_id int,
	CONSTRAINT FK_mealplanm FOREIGN KEY(mealplan_id) REFERENCES mealplan(mealplan_id),
	CONSTRAINT FK_meal FOREIGN KEY(meal_id) REFERENCES meals(meal_id)
);

CREATE TABLE meals_recipes(
meal_id int,
recipe_id int,
CONSTRAINT FK_mealm FOREIGN KEY(meal_id) REFERENCES meals(meal_id),
CONSTRAINT FK_recipemr FOREIGN KEY(recipe_id) REFERENCES recipes(recipe_id)
);

CREATE TABLE recipes_ingredients (
	ingredient_id int,
	recipe_id int,
	/*CONSTRAINT PK_ingredientp PRIMARY KEY (ingredient_id),*/
	CONSTRAINT FK_ingredientf FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id),
	CONSTRAINT FK_recipe FOREIGN KEY(recipe_id) REFERENCES recipes(recipe_id)
);

CREATE TABLE users_recipes (
	user_id int,
	recipe_id int,
	/*CONSTRAINT PK_userp PRIMARY KEY (user_id),*/
	CONSTRAINT FK_userf FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT FK_recipef FOREIGN KEY(recipe_id) REFERENCES recipes(recipe_id)
);

