#!/bin/bash

# Install and start web server
dnf update -y
dnf install -y httpd
systemctl start httpd
systemctl enable httpd

# Variable for the URL
BASE_URL="http://169.254.169.254/latest"

# Get token for metadata requests
TOKEN=$(curl -X PUT "$BASE_URL/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 3600" -s)

# Collect instance info and save to variables
LOCAL_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s "$BASE_URL/meta-data/local-ipv4")
AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s "$BASE_URL/meta-data/placement/availability-zone")
HOST_NAME=$(hostname -f)

# The below creates a simple website to serve as the index.html for the EC2 instance which will be spun up. 
# EOF marks where the HTML starts and stops basically 
cat << EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Life is a Marathon and Not a Sprint</title>
    <style>
        body {
            background-color: blue;
            color: white;
            font-family: Arial, sans-serif;
        }

        h1 {
            color: black;
        }

        img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>

<body>
    <img src="https://www.courierpress.com/gcdn/presto/2022/11/27/PEVC/ff5b76a2-04f9-45a8-b44a-d0698acd4b9f-Screen_Shot_2022-11-26_at_8.00.33_PM.png?width=660&height=563&fit=crop&format=pjpg&auto=webp" alt="Image of Two Guys Mining">

    <h1>About Me.</h1>
    <h3>Hi, I go by Tyler Tedson.</h3>

    <p>I am an aspiring cloud engineer who wants to keep growing, build real skills, and kick ass along the way.</p>

    <h1>Project Description</h1>

    <p>This is a simple project used to display a personal website and information about an EC2 instance.</p>

<div style="text-align: center;">
    <h4>Contact Me On Discord (Footer!)</h4>
    <p>Holla at your boy -- jimmyjohns1900</p>
</div>

    <p><strong>Hostname:</strong> ${HOST_NAME}</p>
    <p><strong>Private IP:</strong> ${LOCAL_IP}</p>
    <p><strong>Availability Zone:</strong> ${AZ}</p>
</body>
</html>
EOF