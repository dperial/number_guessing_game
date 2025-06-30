#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

echo -e "\n~~~~~ A Number Guessing Game ~~~~~\n"

MAIN_MENU(){
  secret_number=$(( RANDOM % 1000 + 1 ))
  USER_DETAIL
  # Capture the user guess number
  GET_USER_GUESS
  # echo "Your guess was: $GUESS_NUMBER"
  # Call of Guess number logic function
  GUESS_NUMBER_LOGIC
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
GUESS_NUMBER_LOGIC(){
  NUMBER_OF_GUESSES=1

  while [[ "$GUESS_NUMBER" != "$secret_number" ]]
  do
    if ! [[ "$GUESS_NUMBER" =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    elif [[ "$GUESS_NUMBER" -gt "$secret_number" ]]
    then
      echo "$secret_number is lower than that $GUESS_NUMBER, guess again:"
    else
      echo "$secret_number is higher than that $GUESS_NUMBER, guess again:"
    fi
    read GUESS_NUMBER
    ((NUMBER_OF_GUESSES++))
  done
  # Insert the final argument into the table games
  $PSQL "INSERT INTO games(secret_number, player_id, guess_count) VALUES($secret_number, $USER_ID, $NUMBER_OF_GUESSES);"
  echo "Welcome back, $USERNAME!, You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $secret_number. Nice job!"
}

MAIN_MENU
