#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
  then
  if [[ $1 =~ ^[0-9]+$ ]]
    then
    ELEMENT_ASKED=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number =$1")
    else
    ELEMENT_ASKED=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE name ='$1' OR SYMBOL = '$1'")
  fi

  if [[ -z $ELEMENT_ASKED ]]
    then
    echo "I could not find that element in the database."
    else
    echo "$ELEMENT_ASKED" | while read A_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR A_MASS BAR MPTC BAR BPTC
    do
    echo "The element with atomic number $A_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $A_MASS amu. $NAME has a melting point of $MPTC celsius and a boiling point of $BPTC celsius."
    done
  fi

  else
  echo "Please provide an element as an argument."
fi
