import boto3
import ast
from colorama import Fore, Back, Style
from pprint import pprint


def list_service_details(region, service, descr_dict):
    try:
        client = boto3.client(service, region_name=region)
        print(Fore.GREEN +f"Details for {service} in {region}:"+Style.RESET_ALL)
        descr = getattr(client,descr_dict[service])()
        pprint(descr)
    except:
        print(Fore.RED+f"Service {service} in {region} not exist")    
    print()

def main():
    regions = ['us-east-1', 'us-east-2']  # Add more regions as needed
    services = ['ec2','rds','els']
    with open("./services.dict", "r") as data:
        descr_dict = ast.literal_eval(data.read())
    for region in regions:
        for service in services:
            list_service_details(region, service, descr_dict)

if __name__ == "__main__":
    main()