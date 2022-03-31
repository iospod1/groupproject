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


| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |

### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
