-- Adel Khorramrouz
-- PE08
-- 22/03/2023
-- ISTE608

-- Use the "recipes" database
USE recipes;

-- 1. Show all recipes that have "Mom" as the source
select name from recipe
where Source LIKE '%Mom%';

-- 2. Show the names of recipes that have fewer than 800 calories per serving
select recipe.name from recipe JOIN nutrition USING (recipeId)
where nutrition.name = "calories" and quantity < 800;

-- 3. Create a shopping list of ingredients (item and quantity) for cooking Beef Parmesan
select ingredients.name, quantity from ingredients JOIN ingredientlist USING(ingredientId)
JOIN recipe Using(recipeId)
WHERE recipe.name LIKE "%Beef Parmesan%";

-- 4. Find recipes that do not use beef, pork, chicken, or lamb
SELECT distinct recipe.name from recipe where recipeid NOT IN(
    select recipeId from ingredients JOIN ingredientlist USING(ingredientId)
    where type in("pork","beef","chicken","lamb"));

-- 5. Find the names of your fish recipes that have fewer than 700 calories per serving
select distinct recipe.name from recipe join nutrition Using(recipeId)
JOIN ingredientlist USING(recipeId)
JOIN ingredients USING(ingredientId)
WHERE type = "fish" and unit = "calories" and nutrition.quantity < 700;
