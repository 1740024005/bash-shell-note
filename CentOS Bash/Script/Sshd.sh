ssh -p57999 -NL 15013:10.3.8.29:5013 106.75.90.26
106.75.90.26 --- 跳板机ip
10.3.8.29:5013 --- 内网服务器ip:端口
15013 --- 映射在本机端口
http://localhost:15013


3 3 * * * ps -ef | grep port=8011 | grep -v grep |awk '{print $2 }' | xargs kill -9
4 3 * * * oc login -u developer -p Admin123
5 3 * * * nohup oc proxy --address=0.0.0.0 --port=8011 --accept-hosts=^*$ &
ExecStart=/usr/bin/dockerd -s overlay -g /data/docker --insecure-registry=10.3.8.29:5000
