#!/bin/bash

export PATH=$PATH:${JMETER_BIN}


#jmeter -n -t test/attempt1.jmx
jmeter -n -t test/${JMETER_TEST} -e -o logs/$(date +%s)-report -j logs/$(date +%s)-jmeter.log -l logs/$(date +%s)-result.jtl 
