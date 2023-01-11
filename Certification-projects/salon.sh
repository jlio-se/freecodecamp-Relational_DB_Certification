#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ My Salon ~~~~~\n"

SERVICE_MENU() {
  if [[ $1 ]]
    then echo -e "\n$1"
  fi

  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")

  echo -e "Welcome to My Salon. How can I help you?\n"
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
  echo -e "$SERVICE_ID) $SERVICE_NAME"
  done
  #Read what service is chosen
  read SERVICE_ID_SELECTED
  #If input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
  #Send to service menu
    SERVICE_MENU "That is not a valid number, please enter the number of service"
  else
    #If service not available
    SERVICE_AVAILABILITY=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_AVAILABILITY ]]
    then
    #Send back to service menu
    SERVICE_MENU "I could not find that service. What would you like today?"
    else
    #get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      #if customer doesn't exist
      if [[ -z $CUSTOMER_NAME ]]
      then
      #get new customer name
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      #insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    #Ask for appointment time
    echo -e "\nWhat time would you like your$SERVICE_NAME_SELECTED,$CUSTOMER_NAME?"
    read SERVICE_TIME
    #Create new appointment
    CREATE_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    #Confirm appointment
    SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME_SELECTED | sed 's/ |//g')
    echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
    fi
  fi

}

SERVICE_MENU