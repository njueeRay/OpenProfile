"""
查询 njueeray.github.io 仓库的 Discussion 分类 ID
"""
import subprocess, os, tempfile, urllib.request, json

# 读取 token
token = open(os.path.join(tempfile.gettempdir(), 'ghtoken.txt')).read().strip()

query = """
{
  repository(owner: "njueeRay", name: "njueeray.github.io") {
    id
    discussionCategories(first: 20) {
      nodes {
        id
        name
      }
    }
  }
}
"""

payload = json.dumps({'query': query}).encode('utf-8')
req = urllib.request.Request(
    'https://api.github.com/graphql',
    data=payload,
    headers={
        'Authorization': f'bearer {token}',
        'Content-Type': 'application/json'
    }
)
resp = urllib.request.urlopen(req).read()
data = json.loads(resp)
print(json.dumps(data, indent=2, ensure_ascii=False))
