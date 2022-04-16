# Sturicous 

## Table of Contents
1. [Overview](#Overview)
3. [Product Spec](#Product-Spec)
4. [Wireframes](#Wireframes)
5. [Schema](#Schema)

## Overview
### Description
Sturicous is an app that can recommend meals based on your general health goals. The goal is to integrate this with on campus food supplies so that way students can always have food and recipes in their pocket that they know they can always look at. 

### App Evaluation
[Evaluation of your app across the following attributes]
- Category: Health and Fitness and Social Networking
- Mobile: This app would be primarily created for a mobile application; however, it could surely be ported onto a website version. Additionally, the application could be created on Android as well. 
- Story: User creates a food emphasis and meals are shown on their feed. Additionally, they can communicate with friends and other people on campus to discuss anything related to meals + health and fitness.  
- Market: The market could be anyone, but there is a general focus towards students who are currently on a college campus. 
- Habit: This app could be used everyday and as often as the user wants to. Health is important everyday, and this app can help with that. 
- Scope: First we want to see if we can pull together APIs and technologies to make this application work with anyone who wants meal recommendations in the context of just a user's geographical location, and their food emphasis. Next, we will want to see if it is possible to pull in data from college campus' dining halls to see if we can create meal options for them. This might not be available in V1, but we hope to continue working after the prototype version. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* User should be able to login or should be able to create a new account.
* User must be able to have a diet emphasis(i.e 'weight loss', 'vegetarian')
* User should be able to see a list of recommended meals given their diet emphasis.
* User should be able to see a meal detail screen per meal item. 
* User can plan meals for each day of the week.
* User can search for meals
* User can see a "Recommended Next Meal" that would be able to get information and items that would be a good idea for their next meal considering their diet plans or diet emphasis.


**Optional Nice-to-have Stories**
* Social Media aspect to the application where users can see what their friends are doing. It would be like a food twitter.
* Share meal items between users/friends. 
* Geo-features could be added to the application so that way meal grociery lists could be created and viewed at a grocery near you.
* User should be able to change their diet emphasis. 
* User should to see 

### 2. Screen Archetypes
* Login Screen:
   * User should be able to log in.
* Register Screen:
   * User should be able to create an account 
   * User must be able to have a diet emphasis(i.e 'weight loss', 'vegetarian')
* Stream:
   * User should be able to see a list of meals given their diet emphasis.
* Recommended Next Meal Screen
   * User should be able to see a "Recommended Next Meal" where the user can see their recommended meal depending on different variables (i.e "Current time of day", "")
   * Geo-features could be added to the application and meal grocery lists could be created and viewed at a grocery near you or on campus.(Optional)
* Detail:
   * User should be able to see a meal detail screen per meal item.
* Search for meal 
   * User should be able to search for a meals. 
* Profile:
   * Social Media aspect to the application where users can see what their friends are doing. 
* Messaging/DM
   * Share meal items between users and friends.
### 3. Navigation

**Tab Navigation** (Tab to Screen)
* All meals based on emphasis.
* Recommended meal of the day.

**Flow Navigation** (Screen to Screen)
 Login Screen:
   * Stream
* Register Screen:
   * Stream
* Stream:
   * Recommended Next Meal Screen
* Recommended Next Meal Screen
   * Stream 
* Detail:
   * Stream 
* Profile:
   * Stream
   * Messaging/DM
* Messaging/DM 
   * Profile

## Week 1 Build Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/Stutricous/Stutricous_app/blob/Yug_Dev/SturicousApp/SturicousApp/StutriousBuildWeek1.gif' title='Week 1 Build Walkthrough' width='' alt='Week 1 Build Walkthrough' />


## Week 2 Build Through

- [X] User stays logged in 
- [X] User sees feed 
- [X] Cells adjust to content 
- [X] Meal Detail Screen has been implemented and it has an ingredient tableView implemented

![implementUserFeed](https://user-images.githubusercontent.com/77123840/163660151-a91dc5de-054b-4b52-8fb6-3adb3da8747f.gif)
![MealDetail](https://user-images.githubusercontent.com/77123840/163660186-18f28437-6658-4c70-ba23-53c1ee5466e6.gif)

## Wireframes
![SecondScannedDocuments](https://user-images.githubusercontent.com/77123840/161363751-d32aefc9-6887-4ce9-ba9f-040f284281b3.jpeg)
## Schema 
### Models
Model: User
|  Property | Type | Description |
| ------------- | ------------- |  ------------- |
| objectID  | String  |  Unique ID for the user |
| profilePicture  | Image |  profile picture for the user  |
| userName | String |  A user's unique username |
| bodyWeight | Number | A user's current body weight |
| dietEmphasis | Array |Array a list of a user's diet emphasis | 

Model: Food Item
|  Property | Type | Description |
| ------------- | ------------- |  ------------- |
| mealID | String | A unique ID for the meal |
| mealDescription | String | A description of the meal/food |
| mealImage  | File |  An image of the meal item |
| Calories | Number | A numerical representation of the calories in the meal |
| Category | String | A Category type for the Food Item |
| Ingredients | Array | A list of string that contains ingredients |
| Similar Meals | Array | A list of similar meals | 

### Networking
* Login Screen:
   * (Read/Get) User request to login(Parse)
* Register Screen:
   * (Create/Post) A New user is created(Parse).
* All meal diet emphasis screen:
   * (Read/Get) Meals and food items that are placed with (Parse)(Spoonacular)(UOFM)
* Recommended Next Meal Screen
   * (Read/Get) Gets a highly recommended food item (Parse)(Spoonacular)(UOFM)
* Detail:
   * (Read/Get) User should be able to see a meal detail screen per meal item(Spoonaculr)
* Search for meal 
   * (Read/Get) User should be able to search for a meals/Recipe(Parse)(Spoonacular)(UOFM) 
* Profile:
   * (Read/Get) Query all food items that have been added to the user's meal list(Spoonacular)
* Messaging/DM
   * (Read/Get) Get all direct messages that the user is involved with
   * (Create/Post) Send a message to a user.
### Existing API Endpoints
- Base URL - https://michigan-dining-api.tendiesti.me/

| HTTP Verb | Endpoint | Description |
| ---------------- | ------------- |  -------------- |
|  **Get**  | v1/DiningHalls | Provides food items from the a dining halls at UOFM


- Base URL - https://spoonacular.com/food-api/


| HTTP Verb | Endpoint | Description |
| ---------------- | ------------- |  -------------- |
| **Get** | /recipes/complexSearch | Searching through recipes/meal
|  **Get** | /recipes/{id}/similar | getting similar id
|  **Get** | /recipes/{id}/nutritionWidget.json | nutrition information of meal
|  **Get** | /recipes/{id}/summary | Automatically generate a summary of the recipe 
|  **Get** | /recipes/{id}/priceBreakdownWidget.json| Generates a recipes price breakdown 
|   **Get** | recipes/cuisine | Classifies a recipes cuisine
|   **Get** | /users/connect | Connects user's information to Spoonacular for food planning



