#!/home/virjid/code/py_code/fy_youdao/venv/bin/python3.6
import urllib.request
import urllib.parse
import sys

word = sys.argv[1]

url = 'http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule'
header = {
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'    
}

data = {
    'i': word,
    'from': 'AUTO',
    'to': 'AUTO',
    'smartresult': 'dict',
    'client': 'fanyideskweb',
    'salt': '15625711934293',
    'sign': 'ccf28e5609a023542396e5ee445e53fd',
    'ts': '1562571193429',
    'bv': '20b1afe876a1cead975908d7f8cceff6',
    'doctype': 'json',
    'version': '2.1',
    'keyfrom': 'fanyi.web',
    'action': 'FY_BY_REALTlME'
}

data = urllib.parse.urlencode(data).encode('utf-8')
request = urllib.request.Request(url, headers=header, data=data)
response = urllib.request.urlopen(request).read()
print(eval(response.decode(encoding="utf-8"))['translateResult'][0][0]['tgt'])

