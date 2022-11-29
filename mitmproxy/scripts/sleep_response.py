from time import sleep
from mitmproxy import http


def response(flow: http.HTTPFlow) -> None:
  sleep(3)
  