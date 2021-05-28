from urllib.request import urlretrieve, urlopen, Request

headers = {'User-Agent':'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'}
url = 'https://www.itworld.com/article/2853992/3-tools-to-check-your-hard-drives-health-and-make-sure-its-not-already-dying-on-you.html'
req = Request(url=url, headers=headers)
html = urlopen(req).read()
print(html)
