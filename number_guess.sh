#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

MAIN_MENU() {
  secret_number=$(( RANDOM % 1000 + 1 ))
  USER_DETAIL
  GUESS_NUMBER_LOGIC
}

USER_DETAIL() {
  while true
  do
    echo -e "\nEnter your username:"
    read USERNAME
    USERNAME=$(echo "$USERNAME" | sed "s/'/''/g")

    if [[ -n $USERNAME ]]
    then
      break
    else
      echo "Username cannot be empty. Please enter a valid username."
    fi
  done

  USER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME';")

  if [[ -n $USER_ID ]]
  then
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE player_id=$USER_ID;")
    BEST_GAME=$($PSQL "SELECT MIN(guess_count) FROM games WHERE player_id=$USER_ID;")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  else
    INSERT_USER=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME');")
    USER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME';")
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  fi
}


GUESS_NUMBER_LOGIC() {
  NUMBER_OF_GUESSES=0

  while true
  do
    if [[ $NUMBER_OF_GUESSES -eq 0 ]]
    then
      echo -e "Guess the secret number between 1 and 1000:"
    fi
    read GUESS_NUMBER

    if ! [[ "$GUESS_NUMBER" =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      continue
    fi

    ((NUMBER_OF_GUESSES++))

    if [[ $GUESS_NUMBER -eq $secret_number ]]
    then
      FOUND_SECRET=$($PSQL "INSERT INTO games(secret_number, player_id, guess_count) VALUES($secret_number, $USER_ID, $NUMBER_OF_GUESSES);")
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $secret_number. Nice job!"
      break
    elif [[ "$GUESS_NUMBER" -gt "$secret_number" ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
  done
}

MAIN_MENU
