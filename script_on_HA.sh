#!/bin/bash

# Define log file location
log_file="/config/satisfactory-state.log"

# Log the start of the script
echo "$(date "+%Y-%m-%d %H:%M:%S") - Script started" >> "$log_file"

# The input string, using the passed argument
input_str="$1"

# Log the received input string
echo "$(date "+%Y-%m-%d %H:%M:%S") - Received input: $input_str" >> "$log_file"

# Removing unnecessary parts of the string to isolate key-value pairs
cleaned_str=$(echo $input_str | sed -e "s/@'_ItemsView(\(.*\))'/\1/" -e "s/', '/,/g" -e "s/'//g")

# Log the cleaned string
echo "$(date "+%Y-%m-%d %H:%M:%S") - Cleaned string: $cleaned_str" >> "$log_file"

# Splitting the key-value pairs into an associative array
declare -A query_params
IFS=',' read -ra pairs <<< "$cleaned_str"
for pair in "${pairs[@]}"; do
    IFS=": " read -r key value <<< "$pair"
    query_params[$key]=$value
done

# Check for optional parameters and assign default values if necessary
if [ -z "${query_params[subfactory]}" ]; then
    query_params[subfactory]="usererror"
fi

if [ -z "${query_params[issueinfo]}" ]; then
    query_params[issueinfo]="Include &issueinfo in the webhook call in Satisfactory to display it here"
fi

# Generating JSON from the associative array
json_output="{"
for key in "${!query_params[@]}"; do
    json_output+="\"$key\": \"${query_params[$key]}\","
done
# Removing the last comma and closing the JSON object
json_output="${json_output%,}}"
echo $json_output > /config/www/satisfactory_alert_state.json

# Log the generated JSON output
echo "$(date "+%Y-%m-%d %H:%M:%S") - Generated JSON: $json_output" >> "$log_file"

# Log the end of the script
echo "$(date "+%Y-%m-%d %H:%M:%S") - Script ended" >> "$log_file"

#shell_command:
#   update_alert_json: '/bin/bash satisfactory-state.sh "{{ query }}"'