#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $WINNER != winner ]] && [[ $OPPONENT != opponent ]]
  then

  #get team_id parsing from both winner and opponent
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  TEAM_ID1=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #if not found based on winner column
    if [[ -z $TEAM_ID ]]
    then
    # add team using winner name
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then echo Inserted into teams, $WINNER
      fi
    fi

    #if not found based on opponent column
    if [[ -z $TEAM_ID1 ]]
    then
    # add team using opponent name
    INSERT_TEAM_RESULT1=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT1 == "INSERT 0 1" ]]
      then echo Inserted into teams, $OPPONENT
      fi

    fi
    #get new team_id
  
  fi
done
