# aerospike
## aerospike
```
docker run -d --name aerospike -p 3000:3000 -p 3001:3001 -p 3002:3002 -p 3003:3003 aerospike

docker run -d rabbitmq --image=rabbitmq:management --expose --port=15672 --restart=Never --dry-run -o yaml > rabbitmq.yml

docker run --rm -it --hostname rabbitmq -p 15672:15672 -p 5672:5672 rabbitmq:3-management
```

## aql asdm
```
docker run -ti --name aerospike-asadm --rm aerospike/aerospike-tools asadm --host 192.168.31.183 --no-config-file
docker run -ti --name aerospike-asadm --rm aerospike/aerospike-tools aql --host 192.168.31.183 --no-config-file
```
