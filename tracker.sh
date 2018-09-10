#!/bin/bash

TIME=0
HOUR=0

main ()
        {

        if [[ $TIME -le 12 ]]; then

                ping -c 100 -i .2 8.8.8.8 >> tracker.txt
                sleep 300
                echo $TIME
                TIME=$(($TIME+1))
                main;

        else

                mpack -s "Hourly Report" tracker.txt example.email@example.com
                rm tracker.txt
                TIME=0
                HOUR=$(($HOUR+1))

                if [[ $HOUR -le 8 ]]; then
                        main;
                else
                        exit;
                fi
        fi

        }

main;
