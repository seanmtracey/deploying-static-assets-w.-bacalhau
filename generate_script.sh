#!/bin/bash

# Read the content of index.html
file_content=$(cat index.html)

# Escape the content for use in the Python script (e.g., escape quotes and newlines if necessary)
escaped_content=$(printf "%s" "$file_content" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' | awk '{printf "%s\\n", $0}')

# Inject the content into the Python script
python_script=$(cat <<EOF
# Python script that writes to a file
output_var = """$escaped_content"""

# Writing the content of the variable to a file
with open("/var/www/html/index.html", "w") as file:
    file.write(output_var)

print("Variable written to file: index.html")
EOF
)

# Base64 encode the entire Python script and output it
encoded_script=$(echo "$python_script" | base64)

# Output the base64 encoded script so it can be used as fulltext variable
echo "$encoded_script"

