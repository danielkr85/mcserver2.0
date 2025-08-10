import requests
import argparse

BASE_URL = "https://meta.fabricmc.net/v2/versions/loader/"

def get_versions(semver):
    url = BASE_URL + semver
    response = requests.get(url)
    response.raise_for_status()
    data = response.json()
    versions = [v.get("loader").get('version') for v in data if v.get("loader").get("stable") == True]
    return '\n'.join(versions)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Fetch Fabric versions.")
    parser.add_argument("semver", type=str, help="The semver to append to the URL.")
    args = parser.parse_args()

    print(get_versions(args.semver))
