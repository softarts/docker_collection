# Install


```
docker volume create qm1data
detach 是后台运行，不需要可以去掉，9443 已被占用，所以改成了19443，1414是MQ的监听端口
docker run --env LICENSE=accept --env MQ_QMGR_NAME=QM1 --volume qm1data:/mnt/mqm --publish 1414:1414 --publish 19443:9443 --detach --env MQ_APP_PASSWORD=passw0rd ibmcom/mq:latest --name zrmq

也可以直接用文件目录映射
docker run --env LICENSE=accept --env MQ_QMGR_NAME=QM1 --volume /Users/zhourui/work/mq:/mnt/mqm --publish 1414:1414 --publish 19443:9443 --detach --env MQ_APP_PASSWORD=password ibmcom/mq:latest --name zrmq

```
console 的登录帐号是admin/passw0rd，  必须是字母数字组合，否则无法通过
使用java client链接过来，不使用用户名的话，会报告错误，因此改用用户名链接，随便指定了一个用户app，报告权限不足
1. 没有权限连接到QM1 queue manager
2. 没有权限连接到dev.queue.1 queue

在/opt/mq下面有一系列工具
dspmqver

开启queue的所有权限
./setmqaut -m QM1 -n DEV.QUEUE.1 -t queue -p app +all

开启 QM1 的权限
./setmqaut -m QM1 -t qmgr -p admin +inq +connect +dsp +setid

显示权限
dspmqaut -m QM1 -t queue -n DEV.QUEUE.1 -p admin_id