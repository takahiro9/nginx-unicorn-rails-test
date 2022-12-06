const fs = require('fs');
const http = require("http");

function sleep(time) {
  const d1 = new Date();
  while (true) {
    const d2 = new Date();
    if (d2 - d1 > time) {
      return;
    }
  }
}
var wstream = fs.createWriteStream("hogefuga");
wstream
.on('open', () => {
  sleep(5000)
})

http.get('http://rails:8080/', (res) => {    
  res
  .pipe(wstream);
});