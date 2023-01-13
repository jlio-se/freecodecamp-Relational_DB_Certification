#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_MENU() {
echo -e "\n~~~~~ Number Guessing Game ~~~~~"
echo -e "\nEnter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games JOIN users USING(user_id) WHERE username = '$USERNAME'")
BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games JOIN users USING(user_id) WHERE username = '$USERNAME'")

  #if user not found
if [[ -z $USER_ID ]]
then
  #Add user to database
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  #Start number guessing game
  echo -e "\nGuess the secret number between 1 and 1000:"
  GUESSING_GAME
  #if user is found
else
  #Welcome them back
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  #Start number guessing game
  echo -e "\nGuess the secret number between 1 and 1000:"
  GUESSING_GAME
fi

}

GUESSING_GAME() {
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
TEXT1="It's lower than that, guess again:"
TEXT2="It's higher than that, guess again:"
t=1
read NUMBER
while [[ $NUMBER != $SECRET_NUMBER ]]
do
  #if input is not a number
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then
    #prompt user to enter number
    echo -e "\nThat is not an integer, guess again:"
    read NUMBER
  #if input is greater than secret number
  elif [[ $NUMBER -gt $SECRET_NUMBER ]]
  #tell user hint
  then
    echo "$TEXT1"
    read NUMBER
  #if input is less than secret number
  elif [[ $NUMBER -lt $SECRET_NUMBER ]]
  #tell user hint
  then
    echo "$TEXT2"
    read NUMBER
  fi
  ((t++))
done

echo -e "\nYou guessed it in $t tries. The secret number was $SECRET_NUMBER. Nice job!"

ADD_GAME_RESULT=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES ($t, $USER_ID)")

}

MAIN_MENU
