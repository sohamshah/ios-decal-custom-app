# Cupcake

## Authors
- Soham Shah
- Liz Lee

##NOTE:
This app has been built on Firebase, in order to allow for scalability of several users and automatically upload recipes and user data to the cloud without any need for using Core Data. Firebase also allows for crash reports, analytics and authentication, which was significant reason to make use of it. To build and run the project, there's a high chance Firebase will have to be installed along with cocoapods. If desired, we can send a video screen capture of the app being used and demonstrating its functionality.

## Purpose
Share and find new recipes, give suggestions to users for their own recipes, show interest in buying recipes made locally (through upvotes) and make/sell recipes with high local interest.

## Features
- View recipes by searching for ingredient/cuisine as keyword
- Upload recipe with a picture
- Like recipes
- Save recipes
- Comment on recipes
- Show interest in local recipes for purchase
- Follow users
- Find users
- Sign in using email/facebook

## Control Flow
- First-time users will be asked to create an account
- First-time users will be asked to provide access to location
- User can search for recipes
- After finding recipe, user can like, save and comment on recipes and show interest (through second upvote option) in local recipes
- User can repost a recipe for their own followers to see
- User can go to an explore page through Nav Bar to see random recipes (not from people they’re following)
- User can search other users through search bar
- Users can go to their profiles through Nav Bar to edit/view their own recipes, view their followers and see people they are following


## Implementation
### Models
- User.Swift
- Recipe.Swift
- SearchResults.Swift (shortened users and recipes)

### Views
- LogInView
- SearchView
- ProfileView (contains user’s recipes, saved recipes, followers and following)
- RecipeView
- ExploreView
- UploadView

### Controllers
- LogInViewController
- SearchViewController
- ProfileViewController
- RecipeViewController
- ExploreViewController
- UploadViewController
