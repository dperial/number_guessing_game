#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

echo -e "\n~~~~~ A Number Guessing Game ~~~~~\n"

MAIN_MENU(){
  secret_number=$(( RANDOM % 1000 + 1 ))
  USER_DETAIL
  # Capture the user guess number
  GET_USER_GUESS
  echo "Your guess was: $GUESS_NUMBER"
}

USER_DETAIL(){
  echo -e "\nEnter your username:"
  read USERNAME
  USERNAME=$(echo "$USERNAME" | sed "s/'/''/g")
  
  USER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME';")
  
  if [[ -z $USER_ID ]]
  then
    $PSQL "INSERT INTO players(username) VALUES('$USERNAME');"
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  else
    echo -e "\nWelcome back, $USERNAME!"
  fi
}
GET_USER_GUESS(){
  echo -e "Guess the secret number between 1 and 1000:"
  read GUESS_NUMBER
}
MAIN_MENU
