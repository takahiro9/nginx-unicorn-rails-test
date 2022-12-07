const { request } = require('./request')
request({request_id: "normal request", url: "http://nginx"})
request({request_id: "slow request", url: "http://nginx", delay_ms: 3000})
// setTimeout(() => request({request_id: "slow request", url: "http://nginx", delay_ms: 3000}), 100)
