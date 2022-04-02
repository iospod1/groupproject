# FootyHi-Lite

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Tracks currently playing teams, athletes and highlights best performers.
This app will use many APIs built by https://app.sportdataapi.com/ to display information regarding currently playing teams and their performance statistics, and highlights (@ top of screen) the best performers, and their upcoming games. May be used to indicate best bets.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Sports Statistics
- **Mobile:** iOS
- **Story:** User can information for each team and player, regarding their number of wins, losses, goals and win streaks.
- **Market:** Football fans, sports commentators
- **Habit:** Daily use, during sport season peak, closer to play-offs.
- **Scope:** API allows 500 requests daily.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can view scrolling table for each league, filtering by teams or players.
* User can click on teams and players, taken to a separate page to view more detailed images.
* Players that are performing very well, based on some calculation, are displayed as "on-fire" and pinned to the top

**Optional Nice-to-have Stories**

* Locally, user can make a list of favored teams and players (stored in a separate view the user can enter).
* Teams that have had a winning streak in the recent weeks, and who have an upcoming game, are displayed as "favored bets" and pinned to the top.


### 2. Screen Archetypes

* Main Storyboard
   * Immediately display list of teams or players (based on user's persisted selection)
   * ...
* Info Screen
   * Displays stats and info (bio, etc) regarding the selected team or player from the main list.
   * ...

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* List of teams
* List of players
* Favored teams
* Favored players

**Flow Navigation** (Screen to Screen)

* Main storyboard
   * Selecting a team or player on the main storyboard navigates to the "info" page
   * Navigation Bar: Teams, Players, Favored Teams, Favored Players.


## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://github.com/iospod1/groupproject/blob/main/UIDesign.png" width=600>

### [BONUS] Digital Wireframes & Mockups
* Wireframe
   * The wireframe above shows the expected flow and views of the app, including the Navigation bar at the top.
   * Navigation Bar: Teams, Players, Favored Teams, Favored Players.
   * The details page will be populated with data obtained from the API mentioned above, displaying team performance related information.
   * The "Bets" page will require some calculation to trigger some extra visuals and/or calculations to highlight the team suggested for a winning bet.

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models

#### Team

| Property | Type | Description | 
| ------------- | ------------- | ------------- |
| teamName  | String  | The team name |
| teamRank  | Integer  | The team's rank |
| teamGoals  | Integer  | The team's goals|
| wins  | Integer  | The number of winning game |
| loses  | Integer  | The number of losing game |
| topPlayer  | String  | The name of top player |
| teamIcon| Image| The icon of the team | 

#### Player

| Property | Type | Description | 
| ------------- | ------------- | ------------- |
| playerName  | String  | The player name |
| playerRank  | Integer  | The player's rank |
| teamName  | String  | The players' team name |
| Assists  | Integer  | The number of assists |
| Goals  | Integer  | The number of goals |
| goalsExpentancy  | Integer  | The expected time per goal |
| playerImage| Image| The image of the player | 

#### Bet

| Property | Type | Description | 
| ------------- | ------------- | ------------- |
| teamName  | String  | The team of the bet |
| gamesPlayed  | Integer  | The number of games played in the season |
| wins  | Integer  | The number of wining in the season |
| draws | Integer  | The number of draws in the season |
| loses  | Integer  | The number of loses in the season |
| prev6Goals  | Integer  | The goal for previous 6 games|
| prev6wins| Integer| The number of winning in previous 6 games |
| prev6loses| Integer| The number of losing in previous 6 games |
| prev6draws | Integer  | The number of draws in previous 6 games |
| goalDifference | Integer| The difference in goal and reality|
| teamIcon | Image| The image of the team|

### Networking
1. **Home Feed Screen**
(Read/GET) Query list of games 
let query = PFQuery(className:"Games")
query.order(byDescending: "timeAt")
query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
   if let error = error { 
      print(error.localizedDescription)
   } else if let posts = posts {
      print("Successfully retrieved list of games.")
   }
}
- (Choose/FAVORITETEAM) Choose a favorite team to follow
- (Choose/FAVORITEPLAYER) Choose a favorite player to follow
- (Remove/FAVORITE TEAM) Remove existing favorie team
- (Create/POST) Create a new comment on a post
- (Delete) Delete existing comment
2. **Create League Table**
(Create/LEAGUETABLE) Create a new league table object
3. **User Screen**
(Read/GETFAVORITETEAM) Query logged to show user's favorite team
