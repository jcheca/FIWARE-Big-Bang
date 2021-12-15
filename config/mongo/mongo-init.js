db = connect("localhost:27017/orion");
db.createCollection("entities");
db.entities.createIndex({"_id.servicePath": 1, "_id.id": 1, "_id.type": 1}, {unique: true});
db.entities.createIndex({"_id.type": 1});
db.entities.createIndex({"_id.id": 1});
db = connect("localhost:27017/orion-openiot");
db.createCollection("entities");
db.entities.createIndex({"_id.servicePath": 1, "_id.id": 1, "_id.type": 1}, {unique: true});
db.entities.createIndex({"_id.type": 1}); 
db.entities.createIndex({"_id.id": 1});' 
db = connect("localhost:27017/iotagentul");
db.createCollection("devices");
db.devices.createIndex({"_id.service": 1, "_id.id": 1, "_id.type": 1});
db.devices.createIndex({"_id.type": 1}); 
db.devices.createIndex({"_id.id": 1});
db.createCollection("groups");
db.groups.createIndex({"_id.resource": 1, "_id.apikey": 1, "_id.service": 1});
db.groups.createIndex({"_id.type": 1});	
db = connect("localhost:27017/iotagentjson");
db.createCollection("devices");
db.devices.createIndex({"_id.service": 1, "_id.id": 1, "_id.type": 1});
db.devices.createIndex({"_id.type": 1}); 
db.devices.createIndex({"_id.id": 1});
db.createCollection("groups");
db.groups.createIndex({"_id.resource": 1, "_id.apikey": 1, "_id.service": 1});
db.groups.createIndex({"_id.type": 1});
