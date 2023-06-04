#!/bin/bash
# Checks if the Ubuntu official website is responding.
#    If it is, opens browser's user to this website.
#    If not, shows the user a GNU error.

url="https://ubuntu.com"

response=$(curl --head --silent --output /dev/null --write-out "%{http_code}" "$url")
if [[ $response -eq 200 ]]; then
    zenity --info --text="You will get redirected to $url"
    exit_code=$?
    if [[ $exit_code -eq 1 ]]; then
        echo "User closed the window. Exiting script."
        exit 1
    fi
    open "$url"
else
    zenity --warning --text="Ubuntu's official website is not available at this moment."
fi

exit 0
