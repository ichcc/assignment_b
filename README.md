# DevOps Eng @ Bizzabo - Assignment

## TL;DR

To deploy the environment, follow these steps:


1. [Install terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. [Authorize in AWS terminal session](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-authentication.html)
3. Change to the `./terraform` folder and run the following commands:
    ```bash
    tf init  # Initialize providers and modules
    tf plan  # Preview the changes
    tf apply # Apply the changes to your AWS account
    ```
## Detailed Instructions
### Variables
The local variables required for the environment are stored in the file `./variables.tf`. 
Please review and modify them if necessary before deploying.
### Tags

Common tags for all deployed resources are defined in `./tags.tf`. The tags currently being used are:

- `deployed_by`: This tag helps identify the person who deployed the environment.
- `enviroment`: This tag is used to specify the environment name. 
- `CreationDate`: This tag displays the creation/update date of resources in ISO 8601 format.

### Self-signed certificate

Since there is no valid certificate available, a self-signed certificate must be used. Follow these steps to generate a new self-signed certificate from the `./certs/` folder:

1. Run the script create_upload_cert.sh by executing the following commands:
    ```bash
    chmod +x create_upload_cert.sh 
    ./create_upload_cert.sh
    ```
2. This script will generate two files: `cert.pem` and `key.pem`, which will be used as the TLS terminator on ALB (Application Load Balancer).
Please ensure you have the necessary permissions and prerequisites before following these steps.



Feel free to make any necessary changes to these tags according to your project requirements.

If you have any questions or face any issues during the deployment process, don't hesitate to reach out to the DevOps team for assistance.

Happy deploying!