#!/bin/bash

to_email=" niranjan.bhardwaj@wittybrains.com "
subject=" Test Email "
message="This is a test email sent from a linux script."

echo "$message" | mailx -s "$subject" "$to_email"
