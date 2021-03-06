#!/bin/bash

for (( rs = 1; rs < 3; rs++ )); do
  echo "Intializing replica ${rs} set"
  replicate="rs.initiate(); sleep(1000); cfg = rs.conf(); cfg.members[0].host = \"mongors${rs}n1\"; rs.reconfig(cfg); rs.status();"
  docker exec -it mongors${rs}n1 bash -c "echo '${replicate}' | mongo"
done
#rs.add(\"mongors${rs}n2\"); rs.add(\"mongors${rs}n3\"); 

sleep 2
# Add better mechanisum to wait for mongos connectivity to be
# established by tailing docker log for connection readiness

docker exec -it mongos1 bash -c "echo \"sh.addShard('mongors1/mongors1n1:27017'); sh.addShard('mongors2/mongors2n1:27017');\" | mongo "