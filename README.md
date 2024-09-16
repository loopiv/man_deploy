### Deployment Steps.

Note before starting the following EC2 Security policy needs to be updated in order for access to be allowed within react and django ports.

Within the AWS EC2 Instance. Open the following ports within AWS EC2 Security Groups. 80 (HTTP), 443 (HTTPS, once implemented), 8000 (Django), 3000 (React)
<br>
<br>
Inbound Rules:
  -  Type: HTTP, Protocol: TCP, Port: 80, Source: 0.0.0.0/0
  -  Type: HTTPS, Protocol:TCP, Port: 443, Source: 0.0.0.0/0 (Not currently needed)
  -  Type: Custom TCP, Protocol: TCP, Port: 8000, Source: 0.0.0.0/0
  -  Type: Custom TCP, Protocol: TCP, Port: 3000, Source: 0.0.0.0/0

After this is updated docker will need to be installed on the server in order to use the dockerfile. after downloading docker onto the server through a preferred method. start and enable docker. 
```bash

# after docker has been installed
sudo systemctl start docker
sudo systemctl enable docker

```

Next, <strike>update https://github.com/rell/man/blob/main/frontend/src/config.ts and nginx.conf </strike> (update environment variable `AWS_PUB_DNS` in Dockerfile) to reflect the current aws ec2 instance - public ipv4 dns.

Next run the Dockerfile.
```bash
docker build -t man-app .
docker run -d -p 8000:8000 -p 3000:3000 man-app
```
