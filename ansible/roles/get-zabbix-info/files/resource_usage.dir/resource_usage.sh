echo "enter zabbix hostname example:"plva000""
read host
jq -r '.params.filter.host |= "'"$host"'"' get_Host.json  > test && mv test get_Host.json
get_Host () {
	hostid=$(curl -k -s -X  POST -H 'Content-Type: application/json-rpc' -d @get_Host.json https://nms.sic.net/api_jsonrpc.php | jq -r '.result[] .hostid')
	echo host is $hostid
	jq -r '.params.hostids |= "'"$hostid"'"' get_Itemid.json > test && cat test >  get_Itemid.json  
	itemid=$(curl -k -s -X POST -H 'Content-Type: application/json-rpc' -d @get_Itemid.json https://nms.sic.net/api_jsonrpc.php  | jq -r '.result[] .itemid')
	echo item is $itemid
	jq -r '.params.itemids |= "'"$itemid"'"' get_History2.json > test2 && cat test2 > get_History.json
	curl -k -s -X POST -H 'Content-Type: application/json-rpc' -d @get_History.json https://nms.sic.net/api_jsonrpc.php | jq -r '.result | .[] | .value'
	rm -f test*
}
get_Host
