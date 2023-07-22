import boto3
from pprint import pprint



def list_aws_services(region):

    session = boto3.Session()
    availbale_services = session.get_available_services()
    return availbale_services

def list_service_details(region, service):
    client = boto3.client(service, region_name=region)

    print(f"Details for {service} in {region}:")
    services_details = boto3.client(service,region_name=region)
    pprint(dir(services_details))

    print()

def main():
    regions = ['us-east-1', 'us-east-2']  # Add more regions as needed
    for region in regions:
        services = list_aws_services(region)
    for region in regions:
        for service in services:
            list_service_details(region, service)

if __name__ == "__main__":
    main()
