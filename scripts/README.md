# Service Description Retrieval Script

## Overview

This script retrieves detailed service descriptions for specified services and regions. It allows you to easily access information about various services provided by different regions. The services and regions you want to query can be customized within the `main` function. To define the description methods for each service, you can refer to the example dictionary provided in `./services.dict`.

## Features

- Retrieves detailed service descriptions dynamically based on specified services and regions.
- Customizable: Modify the `main` function to fetch descriptions for your desired services and regions.

## Requirements

Before running the script, ensure that you have the following prerequisites:

1. Python (version 3 or higher)
2. Python libs: boto3, ast, colorama, pprint

## Usage

1. Open the `./services.dict` file and define the description method for each service you want to retrieve information about.
2. Run the script by executing the following command:

```
python service_description_retrieval.py
```

3. The script will dynamically fetch the service descriptions based on the specified services and regions.
4. View the retrieved information in the console output or modify the script to store it in a file or database.

## Example
We'll add the following entry in the `./services.dict` file:

```
{
    "ec2": "describe_instances"
    }
```

Next, we run the script, and it will fetch the description of "ec2" using the specified method.

## Limitations

Please note that some services may have multiple methods with "describe" in their names. This script currently doesn't support such scenarios automatically. In such cases, you may need to modify the `./services.dict` file and add a specific method that suits your requirements.
