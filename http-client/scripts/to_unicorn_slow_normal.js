const { request, sleep } = require('./request')
request({request_id: "slow request", url: "http://rails:8080", delay_ms: 3000})
request({request_id: "normal request", url: "http://rails:8080"})
