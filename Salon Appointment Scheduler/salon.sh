#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
# Quiet inserts
PSQLq="psql -q -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ NGUYEN SALON ~~~~~\n"

SALON_MENU()
{
  if [[ $1 ]]
  then
    echo $1
  else
    echo Welcome to Nguyen Salon, how can I help you?
  fi
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$AVAILABLE_SERVICES" | while read ID BAR NAME
  do
    echo "$ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SALON_MENU "Not a valid input, please input a number for the service you want."
  else
    SERVICE_ID_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_ID_SELECTED ]]
    then
      SALON_MENU "I could not find that service. What would you like today?"
    else INPUT_INFORMATION
    fi
  fi
}

INPUT_INFORMATION()
{
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    $PSQLq "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi
  if [[ -z $CUSTOMER_ID ]]
  then
    NEW_CUSTOMER $CUSTOMER_PHONE $SERVICE_ID_SELECTED
  else
    CREATE_APPOINTMENT $CUSTOMER_ID $SERVICE_ID_SELECTED
  fi
}

NEW_CUSTOMER()
{
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  $PSQLq "INSERT INTO customers(phone, name) VALUES('$1', '$CUSTOMER_NAME')"
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$1'")

  CREATE_APPOINTMENT $CUSTOMER_ID $2
}

CREATE_APPOINTMENT()
{
  echo -e "\nWhat time would you like your appointment?"
  read SERVICE_TIME

  $PSQLq "INSERT INTO appointments(customer_id, service_id, time) VALUES($1, $2, '$SERVICE_TIME')"
  APPOINTMENT_RESULT=$($PSQL "SELECT services.name, time, customers.name FROM customers INNER JOIN appointments USING(customer_id) INNER JOIN services USING(service_id) WHERE customer_id=$1 AND service_id=$2 AND time='$SERVICE_TIME'")
  echo I have put you down for a $(echo $APPOINTMENT_RESULT | sed -e 's/ |/ at/;s/ |/,/').
}

SALON_MENU