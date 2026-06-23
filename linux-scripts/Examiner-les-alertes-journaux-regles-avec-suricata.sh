analyst@61a586494e8e:~$ cat custom.rules
alert http $HOME_NET any -> $EXTERNAL_NET any (msg:"GET on wire"; flow:established,to_server; content:"GET"; http_method; sid:12345; rev:3;)
analyst@61a586494e8e:~$ ls -l /var/log/suricata
total 0
analyst@61a586494e8e:~$ sudo suricata -r sample.pcap -S custom.rules -k none
23/6/2026 -- 18:04:20 - <Notice> - This is Suricata version 6.0.1 RELEASE running in USER mode
23/6/2026 -- 18:04:20 - <Notice> - all 2 packet processing threads, 4 management threads initialized, engine started.
23/6/2026 -- 18:04:20 - <Notice> - Signal Received.  Stopping engine.
23/6/2026 -- 18:04:20 - <Notice> - Pcap-file module read 1 files, 200 packets, 54238 bytes
analyst@61a586494e8e:~$ ls -l /var/log/suricata
total 16
-rw-r--r-- 1 root root 1418 Jun 23 18:04 eve.json
-rw-r--r-- 1 root root  292 Jun 23 18:04 fast.log
-rw-r--r-- 1 root root 2846 Jun 23 18:04 stats.log
-rw-r--r-- 1 root root 1512 Jun 23 18:04 suricata.log
analyst@61a586494e8e:~$ cat /var/log/suricata/fast.log
11/23/2022-12:38:34.624866  [**] [1:12345:3] GET on wire [**] [Classification: (null)] [Priority: 3] {TCP} 172.21.224.2:49652 -> 142.250.1.139:80
11/23/2022-12:38:58.958203  [**] [1:12345:3] GET on wire [**] [Classification: (null)] [Priority: 3] {TCP} 172.21.224.2:58494 -> 142.250.1.102:80
analyst@61a586494e8e:~$ cat /var/log/suricata/eve.json
{"timestamp":"2022-11-23T12:38:34.624866+0000","flow_id":2075322095401109,"pcap_cnt":70,"event_type":"alert","src_ip":"172.21.224.2","src_port":49652,"dest_ip":"142.250.1.139","dest_port":80,"proto":"TCP","tx_id":0,"alert":{"action":"allowed","gid":1,"signature_id":12345,"rev":3,"signature":"GET on wire","category":"","severity":3},"http":{"hostname":"opensource.google.com","url":"/","http_user_agent":"curl/7.74.0","http_content_type":"text/html","http_method":"GET","protocol":"HTTP/1.1","status":301,"redirect":"https://opensource.google/","length":223},"app_proto":"http","flow":{"pkts_toserver":4,"pkts_toclient":3,"bytes_toserver":357,"bytes_toclient":788,"start":"2022-11-23T12:38:34.620693+0000"}}
{"timestamp":"2022-11-23T12:38:58.958203+0000","flow_id":426531396687092,"pcap_cnt":151,"event_type":"alert","src_ip":"172.21.224.2","src_port":58494,"dest_ip":"142.250.1.102","dest_port":80,"proto":"TCP","tx_id":0,"alert":{"action":"allowed","gid":1,"signature_id":12345,"rev":3,"signature":"GET on wire","category":"","severity":3},"http":{"hostname":"opensource.google.com","url":"/","http_user_agent":"curl/7.74.0","http_content_type":"text/html","http_method":"GET","protocol":"HTTP/1.1","status":301,"redirect":"https://opensource.google/","length":223},"app_proto":"http","flow":{"pkts_toserver":4,"pkts_toclient":3,"bytes_toserver":357,"bytes_toclient":797,"start":"2022-11-23T12:38:58.955636+0000"}}
analyst@61a586494e8e:~$ jq . /var/log/suricata/eve.json | less
{
  "timestamp": "2022-11-23T12:38:34.624866+0000",
  "flow_id": 2075322095401109,
  "pcap_cnt": 70,
  "event_type": "alert",
  "src_ip": "172.21.224.2",
  "src_port": 49652,
  "dest_ip": "142.250.1.139",
  "dest_port": 80,
  "proto": "TCP",
  "tx_id": 0,
  "alert": {
    "action": "allowed",
    "gid": 1,
    "signature_id": 12345,
    "rev": 3,
    "signature": "GET on wire",
    "category": "",
    "severity": 3
  },
  "http": {
    "hostname": "opensource.google.com",
    "url": "/",
    "http_user_agent": "curl/7.74.0",
    "http_content_type": "text/html",
    "http_method": "GET",
    "protocol": "HTTP/1.1",
    "status": 301,
    "redirect": "https://opensource.google/",
    "length": 223
  },
  "app_proto": "http",
  "flow": {
    "pkts_toserver": 4,
    "pkts_toclient": 3,
    "bytes_toserver": 357,
    "bytes_toclient": 788,
    "start": "2022-11-23T12:38:34.620693+0000"
analyst@61a586494e8e:~$ jq -c "[.timestamp,.flow_id,.alert.signature,.proto,.dest_ip]" /var/log/suricata/eve.json
["2022-11-23T12:38:34.624866+0000",2075322095401109,"GET on wire","TCP","142.250.1.139"]
["2022-11-23T12:38:58.958203+0000",426531396687092,"GET on wire","TCP","142.250.1.102"]
analyst@61a586494e8e:~$ jq "select(.flow_id==X)" /var/log/suricata/eve.json
jq: error: X/0 is not defined at <top-level>, line 1:
select(.flow_id==X)                 
jq: 1 compile error
