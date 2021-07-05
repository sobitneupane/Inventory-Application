
import 'package:inventoryapp/config.dart';
import 'package:http/http.dart' as http;
import 'package:inventoryapp/others/model/delete_type_model.dart';

deleteDetails(String pType,int id) async {
  var url = serverRef+'inventory/deletedetails';
print(url);
  try
  {
    final response = await http.post(
        url,
        body: {
          'type':pType,
          'id':id.toString()
        }
    );
    if(response.statusCode==200)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  catch(e)
  {
    print(e);
    return false;
  }
}

updateDetails(String pType,int id,String oType,var q) async {
  var url = serverRef+'inventory/updatedetails';
  print("q=");
  print(q);
  if(oType == "add")
    {
      try
      {
        final response = await http.post(
            url,
            body: {
              'pType':pType,
              'oType':"add",
              'id':id.toString(),
              'quantity':q["quantity"].toString()
            }
        );
        if(response.statusCode==200)
        {
          return true;
        }
        else
        {
          return false;
        }
      }
      catch(e)
      {
        print(e);
        return false;
      }
    }
  else if(oType=="edit")
    {
      try
      {
        final response = await http.post(
            url,
            body: {
              'pType':pType,
              'oType':"edit",
              'id':id.toString(),
              'quantity':q.quantity.toString(),
              'size':q.size,
              'price':q.price.toString(),
              'godown':q.godown,
              'name':q.name
            }
        );
        if(response.statusCode==200)
        {
          return true;
        }
        else
        {
          return false;
        }
      }
      catch(e)
      {
        print(e);
        return false;
      }
    }

}