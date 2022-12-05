from time import sleep
from mitmproxy import http
from mitmproxy import tcp
import logging


def tcp_message(flow: tcp.TCPFlow):
  logging.info("start")
  sleep(30)
  logging.info("finish")
  message = flow.messages[-1]
  message.content = message.content.replace(b"foo", b"bar")
  