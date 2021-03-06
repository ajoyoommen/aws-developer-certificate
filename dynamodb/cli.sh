aws dynamodb create-table \                                                             
    --table-name MusicCollection \
    --attribute-definitions AttributeName=Artist,AttributeType=S AttributeName=SongTitle,AttributeType=S \
    --key-schema AttributeName=Artist,KeyType=HASH AttributeName=SongTitle,KeyType=RANGE \
    --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1


aws dynamodb put-item \                                                                                                                                                     
    --table-name MusicCollection \                                 
    --item '{                    
        "Artist": {"S": "No One You Know"},
        "SongTitle": {"S": "Call Me Today"} ,
        "AlbumTitle": {"S": "Somewhat Famous"} 
      }' \
    --return-consumed-capacity TOTAL

aws dynamodb put-item \                                                                                                                                                     
    --table-name MusicCollection \                                 
    --item '{                    
        "Artist": {"S": "Acme Band"},
        "SongTitle": {"S": "Happy Day"} ,
        "AlbumTitle": {"S": "Songs About Life"}
      }' \
    --return-consumed-capacity TOTAL

aws dynamodb scan --table-name MusicCollection
