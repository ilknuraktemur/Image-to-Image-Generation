import json
from urllib import request, parse

with open("/workflow.json", 'r', encoding='utf-8') as json_file:
    prompt = json.load(json_file)  
    text_data = json.dumps(prompt, indent=4, ensure_ascii=False)

def queue_prompt(prompt):
    p = {"prompt": prompt}
    print(p)
    data = json.dumps(p).encode('utf-8')
    req =  request.Request("http://127.0.0.1:8188/prompt", data=data)
    request.urlopen(req)

queue_prompt(text_data)