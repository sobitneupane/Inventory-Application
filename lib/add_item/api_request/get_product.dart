import 'package:inventoryapp/add_item/model/beet_model.dart';
import 'package:inventoryapp/add_item/model/beet_name_model.dart';
import 'package:inventoryapp/add_item/model/others.dart';
import 'package:inventoryapp/add_item/model/others_name_model.dart';
import 'package:inventoryapp/add_item/model/plywood_model.dart';
import 'package:inventoryapp/config.dart';
import 'package:http/http.dart' as http;


sendToServerPly(PlyWood ply,url)async{

  try {
    var response = await http.get(url);
    if(response.statusCode == 200)
      {
        ply.sentToServer = true;
        ply.sentStatus = "sent";
      }
    else
      {
        ply.sentToServer =false;
        ply.sentStatus = "not sent";
      }
    }
  catch(e){
    ply.sentToServer =false;
    ply.sentStatus = "not sent";
  }
}
sendToServerBeet(Beet beet)async{
var url = serverRef+"inventory/addbeet?" + beet.toString();
  try {
    var response = await http.get(url);
    if(response.statusCode==200) {
      beet.sentToServer = true;
      beet.sentStatus = "sent";
    }
    else
      {
        beet.sentToServer =false;
        beet.sentStatus = "not sent";
      }
  }
  catch(e){
    beet.sentToServer =false;
    beet.sentStatus = "not sent";
  }
}

sendToServerOthers(Others oth)async{
  var url = serverRef+"inventory/addothers?" + oth.toString();
  try {
    var response = await http.get(url);
    if(response.statusCode==200) {
      oth.sentToServer = true;
      oth.sentStatus = "sent";
    }
    else
      {
        oth.sentToServer =false;
        oth.sentStatus = "not sent";
      }
  }
  catch(e){
    oth.sentToServer =false;
    oth.sentStatus = "not sent";
  }
}

sendToServerBeetName(BeetName bn) async{
  var url = serverRef +"inventory/addbeetname" ;


  try {
//    var response = await http.get(url);
    final response = await http.post(
      url,
      body: {
        'name': bn.name,
        'image': bn.image,
      },
    );
    if(response.statusCode==200) {
      bn.sentToServer = true;
      bn.sentStatus = "sent";
    }
    else
    {
      bn.sentToServer =false;
      bn.sentStatus = "not sent";
    }
  }
  catch(e){
    bn.sentToServer =false;
    bn.sentStatus = "not sent";
  }
}

sendToServerOthersName(OthersName othersname) async{
  var url = serverRef +"inventory/addothersname" ;

  try {
//    var response = await http.get(url);
    final response = await http.post(
      url,
      body: {
        'name': othersname.name,
        'image': othersname.image,
      },
    );
    if(response.statusCode==200) {
      othersname.sentToServer = true;
      othersname.sentStatus = "sent";
    }
    else
    {
      othersname.sentToServer =false;
      othersname.sentStatus = "not sent";
    }
  }
  catch(e){
    othersname.sentToServer =false;
    othersname.sentStatus = "not sent";
  }
}