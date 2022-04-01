# Stutricous 

## Table of Contents
1. [Overview](#Overview)
3. [Product Spec](#Product-Spec)
4. [Wireframes](#Wireframes)
5. [Schema](#Schema)

## Overview
### Description
Stutricous is an app that can recommend meals based on your general health goals. The goal is to integrate this with on campus food supplies so that way students can always have food and recipes in their pocket that they know they can always look at. 

### App Evaluation
[Evaluation of your app across the following attributes]
- Category: Health and Fitness and Social Networking
- Mobile: This app would be primarily created for a moblie applicaiton; however, it could surely be ported onto a website version. Additionally, the application could be created on Andriod as well. 
- Story: User creates a food emphasis and meals are shown on their feed. Additionally, they can communicate with friends and other people on campus to discuss anything related to meals + health and fitness.  
- Market: The market could be anyone, but there is a general focus towards students who are currently on a college campus. 
- Habit: This app could be used everyday and as often as the user wants to. Health is important everyday, and this app can help with that. 
- Scope: First we want to see if we can pull together APIs and technologies to make this applicaiton work with anyone who wants meal recommendations in the context of just a user's geographical location, and their food emphasis. Next, we will want to see if it is possible to pull in data from college campus' dining halls to see if we can create meal options for them. This might not be avaliable in V1, but we hope to continue working after the prototype version. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* User should be able to login or should be able to create a new account.
* User must be able to have a diet emphasis(i.e 'weight loss', 'vegeterian')
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
   * User must be able to have a diet emphasis(i.e 'weight loss', 'vegeterian')
* Stream:
   * User should be able to see a list of meals given their diet emphasis.
* Recommended Next Meal Screen
   * User should be able to see a "Recommended Next Meal" where the user can see their recommended meal depending on different variables (i.e "Current time of day", "")
   * Geo-features could be added to the application and meal grociery lists could be created and viewed at a grocery near you or on campus.(Optional)
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
## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>
### [BONUS] Digital Wireframes & Mockups
### [BONUS] Interactive Prototype

## Schema 
### Models
Model: User
|  Property | Type | Description |
| ------------- | ------------- |  ------------- |
| objectID  | String  |  Unique ID for the user |
| profilePicture  | Image |  profile picture for the user  |
| userName | String |  A user's unique username |
| bodyWeight | Number | A user's current body weight |
| dietEmphasis | Array a list of a user's diet emphasis | 

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
   * (Read/Get) User request to login
* Register Screen:
   * (Create/Post) A New user
* All meal diet emphasis screen:
   * (Read/Get) Meals that 
* Recommended Next Meal Screen
   * User should be able to see a "Recommended Next Meal" where the user can see their recommended meal depending on different variables (i.e "Current time of day", "")
   * Geo-features could be added to the application and meal grociery lists could be created and viewed at a grocery near you or on campus.(Optional)
* Detail:
   * User should be able to see a meal detail screen per meal item.
* Search for meal 
   * User should be able to search for a meals. 
* Profile:
   * (Read/Get) Query all food items that have been added to the user's meal list 
* Messaging/DM
   * (Read/Get) Get all direct messages that the user is involved with 
   * (Updated/Put) Send a message to a user.
### Existing API Endpoints 
- Base URL - 
| HTTP Verb | Endpoint| Description | 
| name | type of call |  get        |
