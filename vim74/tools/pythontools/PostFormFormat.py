import json,urllib
def main(argv):
    return urllib.urlencode(json.loads(argv))
