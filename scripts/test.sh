#!/bin/bash

#Check if TP is running
export TPON=$(ps -ef | grep -v grep |grep "tickerplant.q"|wc -l)
export TPID=$(ps -ef |grep -v grep |grep "tickerplant.q" |awk '{ print $2 }' )
if [[ "$TPON">"0"  ]]
then
  echo "Tickerplant is running. PID: "$TPID
else
  echo "The tickerplant is NOT running"
fi

#Check if trade and quote rdb is running
export RTQON=$(ps -ef | grep -v grep |grep "rdbTQ.q"|wc -l)
export RTID=$(ps -ef |grep -v grep |grep "rdbTQ.q" |awk '{ print $2 }' )
if [[ "$RTQON">"0"  ]]
then
  echo "The Trade-Quote RDB is running. PID:  "$RTID
else
  echo "The Trade-Quote RDB is NOT running"
fi

#Check if Complex Event Handler is running
export CEPON=$(ps -ef | grep -v grep |grep "cep.q"|wc -l)
export CEPID=$(ps -ef |grep -v grep |grep "cep.q" |awk '{ print $2 }' )
if [[ "$CEPON">"0"  ]]
then
  echo "The CEP is running. PID: "$CEPID
else
  echo "The CEP is NOT running"
fi

#Check if feed handler is running
export FEEDON=$(ps -ef | grep -v grep |grep "feedHandler.q"|wc -l)
export FEEDID=$(ps -ef |grep -v grep |grep "feedHandler.q" |awk '{ print $2 }' )
if [[ "$FEEDON">"0"  ]]
then
  echo "The feedhandler is running. PID: "$FEEDID
else
  echo "The feedhandler is NOT running"
fi

#Check if Aggregation RDB is running
export RAGGON=$(ps -ef | grep -v grep |grep "rdbAGG.q"|wc -l)
export RAGGID=$(ps -ef |grep -v grep |grep "rdbAGG.q" |awk '{ print $2 }' )
if [[ "$RAGGON">"0"  ]]
then
  echo "The Aggregation RDB is running. PID: "$RAGGID
else
  echo "The Aggregation RDB is NOT running"
fi
