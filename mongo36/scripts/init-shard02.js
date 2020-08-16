rs.initiate(
   {
      _id: "mongors2",
      version: 1,
      members: [
         { _id: 0, host : "mongors2n1:27018" }
      ]
   }
)
