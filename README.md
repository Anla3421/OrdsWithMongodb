# docker-compose for Using Oracle Database API for MongoDB

### 使用說明：
1. 執行`docker-compose up -d`
2. `localhost:8080` 為 ORDS(Oracle REST Data Services) 的GUI
3. mongo 的 connection string 為 `mongodb://inuqa:inuqa@localhost:27017/?authMechanism=PLAIN&authSource=$external&ssl=true&retryWrites=false&loadBalanced=true&tlsAllowInvalidCertificates=true`

### 目前遇到問題 & 待實做項目：
1. 目前 Oracle+ORDS 提供的 Mongodb 版本為 `MongoDB 4.2.14 Community`，處於4.4版這個"分水嶺"之前。
2. mongo 有使用到 `expireAfterSeconds` 這個參數的服務都會有報錯產生((MONGO-67) Unsupported index option: expireAfterSeconds)，但這個一般只會發生在2.2版之前的版本，原因不明。
3. oracle 帳號權限尚需調整，目前已賦予帳號`inuqa` `dba`之權限(理論上的最高權限)，但某些操作(如搜尋index)會遇到反饋沒有權限的狀況。
  