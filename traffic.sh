#!/bin/bash

while true; do
  HOUR=$(date +%H)
  if (( HOUR == 0 )); then
    RATE_LIMIT="130M"
  elif (( HOUR == 1 )); then
    RATE_LIMIT="110M"
  elif (( HOUR == 2 )); then
    RATE_LIMIT="80M"
  elif (( HOUR == 3 )); then
    RATE_LIMIT="50M"
  elif (( HOUR == 4 )); then
    RATE_LIMIT="20M"
  elif (( HOUR == 5 )); then
    RATE_LIMIT="12M"
  elif (( HOUR == 6 )); then
    RATE_LIMIT="17M"
  elif (( HOUR == 7 )); then
    RATE_LIMIT="20M"
  elif (( HOUR == 8 )); then
    RATE_LIMIT="30M"
  elif (( HOUR == 9 )); then
    RATE_LIMIT="50M"
  elif (( HOUR == 10 )); then
    RATE_LIMIT="60M"
  elif (( HOUR == 11 )); then
    RATE_LIMIT="70M"
  elif (( HOUR == 12 )); then
    RATE_LIMIT="70M"
  elif (( HOUR == 13 )); then
    RATE_LIMIT="80M"
  elif (( HOUR == 14 )); then
    RATE_LIMIT="90M"
  elif (( HOUR == 15 )); then
    RATE_LIMIT="100M"
  elif (( HOUR == 16 )); then
    RATE_LIMIT="120M"
  elif (( HOUR == 17 )); then
    RATE_LIMIT="140M"
  elif (( HOUR == 18 )); then
    RATE_LIMIT="160M"
  elif (( HOUR == 19 )); then
    RATE_LIMIT="190M"
  elif (( HOUR == 20 )); then
    RATE_LIMIT="200M"
  elif (( HOUR == 21 )); then
    RATE_LIMIT="170M"
  elif (( HOUR == 22 )); then
    RATE_LIMIT="150M"
  elif (( HOUR == 23 )); then
    RATE_LIMIT="135M"
  elif (( HOUR == 24 )); then
    RATE_LIMIT="130M"
  fi

  echo "Current hour: $HOUR"
  echo "Current rate limit: $RATE_LIMIT"
  wget -O /dev/null --limit-rate="$RATE_LIMIT" https://cdn.andrewnet.net/2022/09edaaf235-7222-4e8e-bac9-e3229ada0be9/1GB.test

  sleep 1
done
