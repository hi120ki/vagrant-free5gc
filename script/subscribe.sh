#!/bin/bash -eu

cd $(dirname $0)

curl 'http://localhost:5000/api/subscriber/imsi-208930000000003/20893' \
  -H 'Accept: application/json' \
  -H 'Accept-Language: ja,en-US;q=0.9,en;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H 'DNT: 1' \
  -H 'Origin: http://localhost:5000' \
  -H 'Pragma: no-cache' \
  -H 'Referer: http://localhost:5000/' \
  -H 'Token: admin' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw '{"plmnID":"20893","ueId":"imsi-208930000000003","AuthenticationSubscription":{"authenticationManagementField":"8000","authenticationMethod":"5G_AKA","milenage":{"op":{"encryptionAlgorithm":0,"encryptionKey":0,"opValue":"8e27b6af0e692e750f32667a3b14605d"}},"opc":{"encryptionAlgorithm":0,"encryptionKey":0,"opcValue":""},"permanentKey":{"encryptionAlgorithm":0,"encryptionKey":0,"permanentKeyValue":"8baf473f2f8fd09487cccbd7097c6862"},"sequenceNumber":"16f3b3f70fc2"},"AccessAndMobilitySubscriptionData":{"gpsis":["msisdn-0900000000"],"nssai":{"defaultSingleNssais":[{"sst":1,"sd":"010203","isDefault":true},{"sst":1,"sd":"112233","isDefault":true}],"singleNssais":[]},"subscribedUeAmbr":{"downlink":"2 Gbps","uplink":"1 Gbps"}},"SessionManagementSubscriptionData":[{"singleNssai":{"sst":1,"sd":"010203"},"dnnConfigurations":{"internet":{"sscModes":{"defaultSscMode":"SSC_MODE_1","allowedSscModes":["SSC_MODE_2","SSC_MODE_3"]},"pduSessionTypes":{"defaultSessionType":"IPV4","allowedSessionTypes":["IPV4"]},"sessionAmbr":{"uplink":"200 Mbps","downlink":"100 Mbps"},"5gQosProfile":{"5qi":9,"arp":{"priorityLevel":8},"priorityLevel":8}},"internet2":{"sscModes":{"defaultSscMode":"SSC_MODE_1","allowedSscModes":["SSC_MODE_2","SSC_MODE_3"]},"pduSessionTypes":{"defaultSessionType":"IPV4","allowedSessionTypes":["IPV4"]},"sessionAmbr":{"uplink":"200 Mbps","downlink":"100 Mbps"},"5gQosProfile":{"5qi":9,"arp":{"priorityLevel":8},"priorityLevel":8}}}},{"singleNssai":{"sst":1,"sd":"112233"},"dnnConfigurations":{"internet":{"sscModes":{"defaultSscMode":"SSC_MODE_1","allowedSscModes":["SSC_MODE_2","SSC_MODE_3"]},"pduSessionTypes":{"defaultSessionType":"IPV4","allowedSessionTypes":["IPV4"]},"sessionAmbr":{"uplink":"200 Mbps","downlink":"100 Mbps"},"5gQosProfile":{"5qi":9,"arp":{"priorityLevel":8},"priorityLevel":8}},"internet2":{"sscModes":{"defaultSscMode":"SSC_MODE_1","allowedSscModes":["SSC_MODE_2","SSC_MODE_3"]},"pduSessionTypes":{"defaultSessionType":"IPV4","allowedSessionTypes":["IPV4"]},"sessionAmbr":{"uplink":"200 Mbps","downlink":"100 Mbps"},"5gQosProfile":{"5qi":9,"arp":{"priorityLevel":8},"priorityLevel":8}}}}],"SmfSelectionSubscriptionData":{"subscribedSnssaiInfos":{"01010203":{"dnnInfos":[{"dnn":"internet"},{"dnn":"internet2"}]},"01112233":{"dnnInfos":[{"dnn":"internet"},{"dnn":"internet2"}]}}},"AmPolicyData":{"subscCats":["free5gc"]},"SmPolicyData":{"smPolicySnssaiData":{"01010203":{"snssai":{"sst":1,"sd":"010203"},"smPolicyDnnData":{"internet":{"dnn":"internet"},"internet2":{"dnn":"internet2"}}},"01112233":{"snssai":{"sst":1,"sd":"112233"},"smPolicyDnnData":{"internet":{"dnn":"internet"},"internet2":{"dnn":"internet2"}}}}},"FlowRules":[]}' \
  --compressed \
  --insecure -s

curl 'http://localhost:5000/api/subscriber' \
  -H 'Accept: application/json' \
  -H 'Accept-Language: ja,en-US;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H 'Cookie: grafana_session=952c71622117e54bcf27dffbb92f21df' \
  -H 'DNT: 1' \
  -H 'Referer: http://localhost:5000/' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Token: admin' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="102", "Google Chrome";v="102"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --compressed -s
