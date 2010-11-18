#!/bin/bash
DIR=`dirname $0`
$DIR/iwatch -v -d -f $DIR/iwatch.xml -p $DIR/iwatch.pid
