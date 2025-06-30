#!/bin/bash
# Connect to the db
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

echo -e "\n~~~~~ A Number Guessing Game ~~~~~\n"

MAIN_MENU(){
  # Generate the secret number
  secret_number=$(( RANDOM % 1000 + 1 ))
  echo "Secret number generated: $secret_number"
}

MAIN_MENU