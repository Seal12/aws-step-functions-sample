#!/usr/bin/env bash
npm run build:clean

mkdir build/

zip build/assignCaseFunction.zip src/assignCaseFunction.js 
zip build/closeCaseFunction.zip src/closeCaseFunction.js
zip build/escalateCaseFunction.zip src/escalateCaseFunction.js
zip build/openCaseFunction.zip src/openCaseFunction.js
zip build/workOnCaseFunction.zip src/workOnCaseFunction.js
