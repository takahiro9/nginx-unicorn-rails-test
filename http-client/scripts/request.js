const fs = require('fs');
const http = require("http");

sleep = (time) => {
  const d1 = new Date();
  while (true) {
    const d2 = new Date();
    if (d2 - d1 > time) {
      return;
    }
  }
}

function date_to_string() {
  const now = new Date()
  return `${now.getHours()}:${now.getMinutes()} ${now.getSeconds()}.${now.getMilliseconds()}`
}

exports.request = async ({request_id, url, delay_ms = 0}) => {
  const wstream = fs.createWriteStream(`${request_id}_response`);
  wstream
  .on('open', () => {
    console.log(request_id)
    sleep(delay_ms)
  })

  const start = performance.now()
  console.log(`request ${request_id} start at ${date_to_string()}.`)
  http.get('http://rails:8080/', (res) => {    
    res
    .pipe(wstream);

    res.on("end", () =>  {
      const end = performance.now()
      console.log(`request ${request_id} finished at ${date_to_string()}. took ${end - start} ms`)
    })
  });
}