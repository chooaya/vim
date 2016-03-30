import sys,json 
def main(argv):
    return json.dumps(json.loads(argv),indent=4,ensure_ascii=False)
