#!/bin/bash

TARGET_DAY=$1
TODAY_DAY=$(date +%-d)

if [ "$TODAY_DAY" -lt "$TARGET_DAY" ]; then
    TARGET_TIMESTAMP=$(date -d "$(date +%Y-%m-)$TARGET_DAY" +%s)
else
    THIS_YEAR=$(date +%Y)
    THIS_MONTH=$(date +%m)

    NEXT_MONTH=$((10#$THIS_MONTH + 1))
    NEXT_YEAR=$THIS_YEAR

    if [ "$THIS_MONTH" -eq 12 ]; then
        NEXT_MONTH=1
        NEXT_YEAR=$((THIS_YEAR + 1))
    fi

    TARGET_TIMESTAMP=$(date -d "$NEXT_YEAR-$NEXT_MONTH-$TARGET_DAY" +%s)
fi

NOW_TIMESTAMP=$(date +%s)

DAYS=$(( (TARGET_TIMESTAMP - NOW_TIMESTAMP) / 86400 + 1))

echo $DAYS

