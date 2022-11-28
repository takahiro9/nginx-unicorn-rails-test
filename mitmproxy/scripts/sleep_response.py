from time import sleep
from urllib.parse import urlparse

def responseheaders(flow):
  def modify(chunks):
        sleep(3)
        # continue to stream original response
        yield from chunks
  flow.response.stream = modify