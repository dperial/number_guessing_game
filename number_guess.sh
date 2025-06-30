#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

echo -e "\n~~~~~ A Number Guessing Game ~~~~~\n"

MAIN_MENU(){
  secret_number=$(( RANDOM % 1000 + 1 ))
  USER_DETAIL
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
    echo -e "\nWelcome back"
  fi
}
MAIN_MENU
