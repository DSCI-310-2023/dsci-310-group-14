# Predicting NBA All-Star Status Based on Player Performance

## dsci-310-group-14

Every year in February, NBA fans rejoice as they get to see their favorite players selected for the all-star game. Players are selected by media and fan votes, meaning that popularity is the dominating factor. However, players are more likely to be popular based on their individual game-to-game performance (Grimshaw & Larson, 2020). Thus, this analysis hopes to answer the question: **Can an NBA player’s selection to the all-star game be predicted by their annual performance?**

In order to answer this question, we will be using two sets of data, one from ["NBA Player Stats” on nba.com](https://www.nba.com/stats/players/traditional/?sort=PTS&dir=-1&Season=2015-16&SeasonType=Regular%20Season) and [“NBA All Stars 2000-2016” from kaggle.com](https://www.kaggle.com/fmejia21/nba-all-star-game-20002016?select=NBA+All+Stars+2000-2016+-+Sheet1.csv). NBA Player Stats includes all the NBA player statistics for each season from 2010-2016 and the All Star dataset includes the all star statistics from 2000-2016. Using these datasets we aim to make a classification model that will predict whether a player will be an all star for each season based on their annual performances.

The variables that we will be looking at for this data set are the following:
- Year: Season that the player played.
- Player: Name of the player.
- MIN: Average number of minutes that the player played per game.
- PTS: Average number of points that the player scored per game.
- FG.: Field Goal Percentage.
- REB: Average number of rebounds that the player made per game.
- AST: Average number of assists that the player got per game.
- Is_All_Star: Whether the player was an All-Star in that season. **This is our classifier.**

We chose these variables because they are the most indicative of a player's offensive output, which is the main focus of the all star game(Nguyen et al., 2021).

# Replication
- This project is attached with a Dockerfile using a Rocker Tidyverse image.
  The base image can be accessed here: https://hub.docker.com/r/rocker/tidyverse
  
  
To clone this repository into your local computer:
1) Click on the green `<> Code` button and Copy the HTTPS of the repository
2) Open Terminal and navigate to your desired directory in which you clone the repository 
3) Clone the repository using the following command: <br/>
  `git clone <URL>`
4) Navigate to the project directory using the following command: <br/>
 `cd dsci-310-group-14`
  
To run the container please follow the below steps:
1) Ensure you are in the correct project directory.
2) Open command prompt to pull the Docker image from DockerHub, enter the following: <br/>
3) `docker pull ysong09/dsci-310-group-14:latest`. This ensures you have the latest image on your local machine. 
4) Then, paste the following: <br/>
`docker run -e PASSWORD=apassword -p 8787:8787 -v /$(pwd)://home//rstudio ysong09/dsci-310-group-14:latest`
5) Copy the following into a web browser of your choice: `http://localhost:8787/`, make sure to use your local port 8787.
6) Enter user: `rstudio` and password: `apassword`


To recreate the analysis and results:
1) run `make clean` in the Rstudio terminal in the `http://localhost:8787/` environment
2) The step above ensures that `make` knows that these files and figures need to be recreated through the timestamps.
3) Then go to the Rstudio terminal again and enter the following command:
`make all`
4) This might take a couple of minutes, but by the end, you should have the folders `data/` and `results/` which contain the figures, recipes, and csv files used in creating the R-Markdown Analysis file for our project.
5) You can find the rendered report file `NBA_All-Star_Report.html` in the root of the repository after running `make all` in `step 3`

## Dependencies
- tidyverse
- GGally
- tidymodels
- themis
- kknnn
- testthat
- here
- docopt 
- bookdown

## Team Members
- Berkay Talha Acar 
- Emilio Dorador 
- Jeffrey Song 
- Ray Nguyen

# LICENSES
- MIT License
- <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.
