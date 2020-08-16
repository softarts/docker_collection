rs.initiate(
   {
      _id: "cfgrs",
      configsvr: true,
      version: 1,
      members: [
         { _id: 0, host : "mongocfg1:27017" }
      ]
   }
)
