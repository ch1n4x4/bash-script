#!/bin/bash

greet() {
	echo "Hello from a function!"
	echo "Functions make code reasonable"
}

echo "Before calling function"
greet
echo "After calling function"
greet

