#!/usr/bin/env bash

curl -X POST http://localhost:3000/courses/ -H "Content-Type: application/json" -d @course1.json
curl -X POST http://localhost:3000/courses/ -H "Content-Type: application/json" -d @course2.json
curl -X POST http://localhost:3000/courses/ -H "Content-Type: application/json" -d @course3.json
