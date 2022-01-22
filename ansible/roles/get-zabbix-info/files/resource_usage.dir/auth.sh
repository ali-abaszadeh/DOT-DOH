#!/bin/bash
curl_getAuth () {
	curl -k -s -X  POST -H 'Content-Type: application/json-rpc' -d @auth.json https://nms.sic.net/api_jsonrpc.php | jq -r '.result' | xargs echo 'token is: '
}

curl_getAuth
