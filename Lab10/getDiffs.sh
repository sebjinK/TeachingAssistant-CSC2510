#!/bin/bash

# Run the student's script strip colors and save the output to a temporary file
bash $2 $3 | sed 's/\x1b\[[0-9;]*m//g' > student_output.txt

# Run the reference script strip colors and save the output to another temporary file
bash $1 | sed 's/\x1b\[[0-9;]*m//g' > correct_output.txt

# Compare the outputs and show only the differences
differences=$(diff student_output.txt correct_output.txt)

if [ -z "$differences" ]; then
    echo "The student's output is correct!"
else
    echo "The student's output is incorrect!"
    echo "Differences:"
    echo "$differences"
fi
