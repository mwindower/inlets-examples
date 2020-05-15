#!/bin/bash

cd 0-classic && ./stop.sh && cd -
cd 2-cloud-native && ./stop.sh && cd -
cd 1-bridge && ./stop.sh && cd -