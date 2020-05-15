#!/bin/bash

cd 0-classic && ./start.sh && cd -
cd 2-cloud-native && ./start.sh && cd -
cd 1-bridge && ./start.sh && cd -