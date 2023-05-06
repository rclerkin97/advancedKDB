#!/bin/bash
export TPON=$(ps -ef | grep -v grep |grep "tickerplant.q"|wc -l)
export RTQON=$(ps -ef | grep -v grep |grep "rdbTQ.q"|wc -l)
export CEPON=$(ps -ef | grep -v grep |grep "cep.q"|wc -l)
export FEEDON=$(ps -ef | grep -v grep |grep "feedHandler.q"|wc -l)
export RAGGON=$(ps -ef | grep -v grep |grep "rdbAGG.q"|wc -l)
export TPPORT=$(ps -ef | grep -v grep |grep "tickerplant.q"|awk '{print $2}')
export RTQPORT=$(ps -ef | grep -v grep |grep "rdbTQ.q"|awk '{print $2}')
export CEPPORT=$(ps -ef | grep -v grep |grep "cep.q"|awk '{print $2}')
export FEEDPORT=$(ps -ef | grep -v grep |grep "feedHandler.q"|awk '{print $2}')
export RAGGPORT=$(ps -ef | grep -v grep |grep "rdbAGG.q"|awk '{print $2}')

#Stopping the TP
if [[ "$TPON">"0"  ]]
then
          echo "The Tickerplant is running, would you like to stop it? (y/n)"
          read tpbool
                if [ "$tpbool" = "y" ]; then
                kill -9 $TPPORT
                echo "The tickerplant has stopped running"
                fi
else
  echo "The tickerplant is NOT running"
fi

#Stopping T and Q RDBs
if [[ "$RTQON">"0"  ]]
then
          echo "The Trade-Quote RDB is running, would you like to stop it? (y/n)"
          read rtqbool
                if [ "$rtqbool" = "y" ]; then
                kill -9 $RTQPORT
                echo "The Trade-Quote RDBs have stopped running"
                fi
else
  echo "The Trade-Quote RDB is NOT running"
fi

#Stopping the AGG RDB
if [[ "$RAGGON">"0"  ]]
then
          echo "The Aggregation RDB is running, would you like to stop it? (y/n)"
          read raggbool
                if [ "$raggbool" = "y" ]; then
                kill -9 $RAGGPORT
                echo "The Aggregation RDB has stopped running"
                fi
else
  echo "The Aggregation RDB is NOT running"
fi

#Stopping the Complex Event Handler
if [[ "$CEPON">"0"  ]]
then
          echo "The CEP is running, would you like to stop it? (y/n)"
          read cepbool
                if [ "$cepbool" = "y" ]; then
                kill -9 $CEPPPORT
                echo "The CEP has stopped running"
                fi
else
  echo "The CEP is NOT running"
fi

#Stopping the Feed Handler
if [[ "$FEEDON">"0"  ]]
then
          echo "The Feedhandler is running, would you like to stop it? (y/n)"
          read feedbool
                if [ "$feedbool" = "y" ]; then
                kill -9 $FEEDPORT
                echo "The Feedhandler has stopped running"
                fi
else
  echo "The Feedhandler is NOT running"
fi
