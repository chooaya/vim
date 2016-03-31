import sys,json 
import cgi
def main(argv):
    return json.dumps(cgi.parse_qs(argv),indent=4,ensure_ascii=False)
