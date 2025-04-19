#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
PSQLq="psql -q --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(shuf -i 1-1000 -n 1)

echo Enter your username:
read USERNAME

USER_INFO=$($PSQL "SELECT games_played, best_game FROM players WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  $($PSQLq "INSERT INTO players(username, games_played, best_game) VALUES('$USERNAME', 0, 2147483647)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  USER_INFO=$($PSQL "SELECT best_game FROM players WHERE username='$USERNAME'")
  read BEST_GAME <<< $USER_INFO
else
  IFS="|" read GAMES_PLAYED BEST_GAME <<< $USER_INFO
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

COUNT=1
echo "Guess the secret number between 1 and 1000:"
read GUESS

while [[ $GUESS != $RANDOM_NUMBER ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
  else
    COUNT=$(($COUNT + 1))
    if [[ $GUESS -lt $RANDOM_NUMBER ]]
    then
      echo "$RANDOM_NUMBER It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
  fi
  read GUESS
done

echo "You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
if [[ $COUNT -lt $BEST_GAME ]]
then
  $($PSQLq "UPDATE players SET games_played = games_played + 1, best_game = $COUNT WHERE username = '$USERNAME'")
else
  $($PSQLq "UPDATE players SET games_played = games_played + 1 WHERE username = '$USERNAME'")
fi