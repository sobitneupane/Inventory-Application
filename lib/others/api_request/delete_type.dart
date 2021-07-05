
import 'package:inventoryapp/config.dart';
import 'package:http/http.dart' as http;
import 'package:inventoryapp/others/model/delete_type_model.dart';

Future deleteType(DeleteType deleteType) async {
var url = serverRef+'inventory/deletetype';

try
    {
      final response = await http.post(
        url,
        body: {
          'type':deleteType.pType,
          'name':deleteType.name
        }
      );
      if(response.statusCode==200)
        {
          deleteType.sentToServer = true;
          deleteType.sentStatus = "sent";
        }
      else
        {
          deleteType.sentToServer =false;
          deleteType.sentStatus = "not sent";
        }
    }
    catch(e)
  {
    deleteType.sentToServer =false;
    deleteType.sentStatus = "not sent";
  }
}