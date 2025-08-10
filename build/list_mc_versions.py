import requests
import re

URL = "https://meta.fabricmc.net/v2/versions/game"

def get_versions():
    response = requests.get(URL)
    response.raise_for_status()
    data = response.json()
    versions = [v['version'] for v in data if v["stable"] == True]
    semver_versions = [v for v in versions if re.match(r'^\d+\.\d+\.\d+$', v)]
    return '\n'.join(semver_versions)

if __name__ == "__main__":
    print(get_versions())
