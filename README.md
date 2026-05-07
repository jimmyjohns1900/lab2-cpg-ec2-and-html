# lab2-cpg-ec2-and-html

So I went ahead and created a shell script per the instructions for Lab 2. I used the ALB-ASG Terraform file structure (learned in Zion back in Feb/Mar '26) to deploy rather than using clickops, so this was built by pulling the DNS link from the ALB.

- Tyler T.

# Startup Script Overview #

1. The script starts up and initializes the webserver. 
2. The base url pulls EC2 instance metadata. 
3. The token is called with the curl command to make metadata requests and to specify the time to live. 
4. This script pulls more data of the EC2 name and assigns it to the variable "HOST_NAME."
5. The script then creates an HTML file listing the EC2 instance's local IP address and hostname.
6. Finally, I have adjusted attributes within the HTML file to adjust the background color, text color, and alignment, as well as utilized different headers.
 