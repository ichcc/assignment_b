#!/bin/bash
openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=assignment.bizzabo.com"
# aws acm import-certificate --certificate file://cert.pem --private-key file://key.pem --region us-east-2 --cli-binary-format raw-in-base64-out