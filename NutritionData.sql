-- OBJECTIVE: Analyze fast food nutrition data to explore the healthiness of food items at certain restaurants.

/* Restaurants analyzed include: Arbys, Burger King, Chick Fil A, Dairy Queen,
		Mcdonalds, Sonic, Subway, and Taco Bell. */

-- Create the database in MySQL & upload data
CREATE DATABASE fastfood;

-- BEGIN EXPLORATORY DATA ANALYSIS

-- What is the average amount of total fat, saturated fat, and trans fat across all food items?
SELECT
	AVG(total_fat) AS avg_total_fat,
    AVG(sat_fat) AS avg_sat_fat,
    AVG(trans_fat) AS avg_trans_fat
FROM nutritiondata;
-- Averages: Total Fat = 26.01, Saturated Fat = 7.98, and Trans Fat = 0.50


-- What is the average cholesterol content of all food items?
SELECT AVG(cholesterol) AS avg_cholest
FROM nutritiondata; 
-- Average Cholesterol = 71.16


-- What is the average amount of trans fat for each restaurant?
SELECT
	restaurant,
	AVG(trans_fat) AS avg_trans
FROM nutritiondata
GROUP BY restaurant
ORDER BY avg_trans;
-- Average trans fat ranges from 0 to 0.96 with Chick Fil A having the least and Sonic having the most. 
-- Arbys, McDonalds, Dairy Queen, and Burger King are above the mean.


-- What is the average amount of sodium in the food items?
SELECT
	AVG(sodium) AS avg_sod
FROM nutritiondata;
-- Average Sodium = 1233.74mg


-- What is the overall percentage of calories that come from fat across all food items?
SELECT
	(SUM(cal_fat) / SUM(calories)) * 100 as fat_perc
FROM nutritiondata;
-- Total calories from fat = 44.45%


-- What is the average sugar content of all items?
SELECT
	AVG(sugar) AS avg_sug
FROM nutritiondata;
-- Average Sugar = 7.20


-- Which food items have the highest ratio of calories from fat to total calories?
SELECT
	restaurant,
    item,
    (cal_fat / calories) * 100 as fat_perc
FROM nutritiondata
ORDER BY fat_perc DESC
LIMIT 10;
/* Surprisingly, 7 out of the 10 items are salads with Burger King and Subway appearing more often than others.

Burger King, 	Side Garden Salad and Avocado Ranch Dressing, 82.6087
Burger King, 	Side Caesar Salad with dressing, 81.8182
Arbys, 			Greek Gyro Salad, 80.9524
Subway, 		Big Hot Pastrami Melt Salad, 75.0000
Dairy Queen, 	Regular Cheese Curds, 74.5455
Burger King, 	American Brewhouse King, 73.1613
Subway, 		Tuna Salad, 69.3548
Sonic, 			Garlic Parmesan Dunked Ultimate Chicken Sandwich, 66.6667
Subway, 		Chicken Bacon Ranch Melt Salad includes Ranch dressing, 66.6667
Arbys, 			Super Greek Salad, 66.6667 */


-- What are the top 5 food items with the highest saturated fat content?
SELECT
	restaurant,
    item,
    sat_fat
FROM nutritiondata
ORDER BY sat_fat DESC
LIMIT 5;
/* Burger King's American Brewhouse King contains the most saturated fat. 
Sonic double cheeseburgers and Dairy Queen cheese curds are loaded with saturated fat.

Burger King, 	American Brewhouse King, 47
Dairy Queen, 	Large Cheese Curds, 43
Sonic, 			Super Sonic Bacon Double Cheeseburger w mayo, 36
Sonic, 			Super Sonic Double Cheeseburger W Mayo, 34
Sonic, 			Super Sonic Jalapeno Double Cheeseburger, 32 */


-- What are the top 5 food items with the highest trans fat content?
SELECT
	restaurant,
    item,
    trans_fat
FROM nutritiondata
ORDER BY trans_fat DESC
LIMIT 5;
/* Burger King's American Brewhouse King also has the most trans fat.
Burger King and Sonic have items with the most trans fat of all restaurants.
Double cheeseburgers seem to be loaded with saturated and trans fat. 

Burger King, 	American Brewhouse King, 8
Sonic, 			Super Sonic Double Cheeseburger W Ketchup, 4
Sonic, 			Super Sonic Bacon Double Cheeseburger w mayo, 4
Burger King, 	Rodeo King, 4
Sonic, 			Super Sonic Jalapeno Double Cheeseburger, 4 */


-- Which food items have the lowest amount of total fat?
SELECT
	restaurant,
    item,
    total_fat
FROM nutritiondata
ORDER BY total_fat 
LIMIT 5;
/* Dairy Queen & Subway have food items with the lowest total fat.

Dairy Queen, 	Side Salad, 0
Subway, 		Veggie Delite Salad, 1
Subway, 		Kids Mini Sub Veggie Delite, 2
Dairy Queen, 	Grilled Chicken Garden Greens Salad, 2
Subway, 		Kids Mini Sub Turkey Breast, 2 */


-- What are the top 10 food items with the highest calories?
SELECT
	restaurant,
    item,
    calories
FROM nutritiondata
ORDER BY calories DESC
LIMIT 10;
/* McDonalds has most food items with the highest calories.
Chicken items seem to pack the most calories. 
The larger the item, the more calories it will provide. 

Mcdonalds, 		20 piece Buttermilk Crispy Chicken Tenders, 2430
Mcdonalds, 		40 piece Chicken McNuggets, 1770
Mcdonalds, 		10 piece Sweet N Spicy Honey BBQ Glazed Tenders, 1600
Burger King, 	American Brewhouse King, 1550
Mcdonalds, 		12 piece Buttermilk Crispy Chicken Tenders, 1510
Sonic, 			Garlic Parmesan Dunked Ultimate Chicken Sandwich, 1350
Sonic, 			Super Sonic Bacon Double Cheeseburger w mayo, 1280
Dairy Queen, 	6 Piece Chicken Strip Basket w Country Gravy, 1260
Burger King, 	Rodeo King, 1250
Sonic, 			Super Sonic Double Cheeseburger W Mayo, 1220 */


-- Which food items have the highest and lowest total carbs?
SELECT
	restaurant,
    item,
    total_carb
FROM nutritiondata
ORDER BY total_carb DESC
LIMIT 5;
/* Fried chicken items appear to have more carbs than other items. 

Mcdonalds, 		10 piece Sweet N Spicy Honey BBQ Glazed Tenders, 156
Sonic, 			5 Piece Super Crunch Chicken Strip Dinner, 126
Dairy Queen, 	6 Piece Chicken Strip Basket w Country Gravy, 121
Subway, 		Footlong Meatball Marinara, 118
Subway, 		Footlong Sweet Onion Chicken Teriyaki, 118 */

SELECT
	restaurant,
    item,
    total_carb
FROM nutritiondata
ORDER BY total_carb
LIMIT 5;
/* Grilled chicken items appear to have less carbs than other items. 

Dairy Queen, 	Regular Cheese Curds, 0
Chick Fil A, 	4 Piece Grilled Chicken Nuggets, 1
Chick Fil A, 	6 Piece Grilled Chicken Nuggets, 2
Chick Fil A, 	8 piece Grilled Chicken Nuggets, 2
Chick Fil A, 	12 Piece Grilled Chicken Nuggets, 3 */


-- How many food items from each restaurant exceed 1150mg of sodium content?
SELECT
	restaurant,
    count(item) as num_of_items
FROM nutritiondata
WHERE sodium > 1150 -- half of the recommended daily amount
GROUP BY restaurant
ORDER BY num_of_items;
/* Chick Fil A has the least number of items while Subway has the most.

Chick Fil A, 	9
Dairy Queen, 	18
Burger King, 	26
Mcdonalds, 		27
Sonic, 			28	
Arbys, 			36
Taco Bell, 		36
Subway, 		46 */


-- How many food items from each restaurant exceed 2000 calories?
SELECT
	restaurant,
    count(item) as num_of_items
FROM nutritiondata
WHERE calories > 2000 -- the total daily recommended amount for women
GROUP BY restaurant
ORDER BY num_of_items;
/* Mcdonalds is the only restaurant with 1 item having more than 2000 calories. */

SELECT
	restaurant,
    item,
    calories
FROM nutritiondata
WHERE calories > 2000;
/* The food item with more than 2000 calories is the 20 piece Buttermilk Crispy Chicken Tenders. */


-- How many food items per restaurant have saturated fat content higher than 10 grams?
SELECT
	restaurant,
    count(item) as num_of_items
FROM nutritiondata
WHERE sat_fat > 10 -- almost all of the recommended daily amount (13 grams)
GROUP BY restaurant
ORDER BY num_of_items;
/* Taco Bell has the least number of items while Burger King has the most.

Taco Bell, 		13
Mcdonalds, 		15
Arbys, 			16
Dairy Queen, 	17
Sonic, 			19
Subway, 		19
Burger King, 	23 */

-- Which fast food restaurant has the highest average calories per food item?
SELECT
	restaurant,
    AVG(calories) AS avg_cal
FROM nutritiondata
GROUP BY restaurant
ORDER BY avg_cal DESC
LIMIT 2; -- Sonic has the highest average (641.92) with Mcdonalds as a close second (640.35)


-- What are the average macronutrients by restaurant?
SELECT
	restaurant,
    AVG(calories) AS avg_cal,
    AVG(total_carb) AS avg_carb,
    AVG(protein) AS avg_protein,
    AVG(total_fat) AS avg_fat
FROM nutritiondata
GROUP BY restaurant;
/* On average, Chick Fil A offers the least amount of calories, carbs, and fat while Taco Bell offers the least amount of protein.
Burger King offers the most amount of fat. Mcdonalds offers the most protein. 
Subway offers the most carbs while Sonic offers the most calories.


restaurant, 	avg_cal, 	avg_carb, 	avg_protein, 	avg_fat
Arbys, 			532.7273, 	44.8727, 	29.2545, 		26.9818
Burger King, 	576.0000, 	37.1667, 	29.3333, 		34.6167
Chick Fil A, 	352.0000, 	25.5200, 	30.7600, 		14.3200
Dairy Queen, 	520.2381, 	38.6905, 	24.8333, 		28.8571
Mcdonalds, 		640.3509, 	48.7895, 	40.2982, 		31.8070
Sonic, 			641.9231, 	46.8654, 	29.0000, 		37.1346
Subway, 		503.0208, 	54.7188, 	30.3125, 		18.4792
Taco Bell, 		443.0088, 	46.5752, 	17.3805, 		20.8584 */


/* CONCLUSIONS:

1. Small amounts of trans fats are still found in fast food items. 
2. There is a very high percentage of fat in fast food, close to 50% of total calories.
3. Food items with the highest percentage of fat are more commonly salads with dressing.
4. Double cheeseburgers are loaded with trans fats and saturated fats.
5. Burger King and Sonic should be avoided.
6. Chick Fil A would be the best option as it relates to health. 
*/


