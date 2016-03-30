import sys,json 
import urlparse
def main(argv):
    parsed = urlparse.urlparse("http://test/?"+argv)
    return json.dumps(urlparse.parse_qs(parsed.query),indent=4,ensure_ascii=False)
