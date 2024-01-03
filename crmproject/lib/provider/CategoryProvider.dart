import 'package:crmproject/helpers/ApiHandler.dart';
import 'package:crmproject/helpers/ErrorHandler.dart';
import 'package:crmproject/model/Category.dart';
import 'package:crmproject/resources/UrlResources.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier
{

  List<Category>? allData;


  Future<void> Getcategory(BuildContext context) async {
    try
    {

     var headers=
     {
     "Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJTdW1pdCIsIkdJRCI6IjQyNGFkNmQ1LTBlZTEtNDU3Zi04NWIzLTAxYjI1ZGEwYjdjZSIsImp0aSI6IjRmYmJjYThjLTY0ZTgtNDdiZS1iZDNmLWI5YzUyZTJhM2Q0NCIsImlkIjoiNDg0IiwiUmVnaWQiOiI4IiwicGFja2FnZWlkIjoiIiwiY3VzdGlkIjoiU1VNMDQ3IiwiZmlyc3RuYW1lIjoiU3VtaXQiLCJsYXN0bmFtZSI6IlZhZGhpeWFyYSIsIm1vYmlsZSI6Ijk0ODQ1NzMyOTQiLCJlbWFpbCI6InN1bWl0QGdtYWlsLmNvbSIsInVzZXJuYW1lIjoiU3VtaXQiLCJyb2xlIjoiQWRtaW4iLCJsb2dpbnRpbWUiOiIwOC0xMi0yMDIzIDEwOjU5OjMwIiwiZXhwIjoxNzA0NjkxNzcwLCJpc3MiOiJodHRwOi8vVGF4ZmlsZUNybUdTVC5jb20iLCJhdWQiOiJodHRwOi8vVGF4ZmlsZUNybUdTVC5jb20ifQ.xJsUndfZO4fpUesgpUi6biBt3bR3UsGszIUOpJ1tPmg"
    };

      await ApiHandler.getRequest(UrlResources.Get,headers).then((json) async {
        allData = json.map<Category>((obj) => Category.fromJson(obj)).toList();
        print('printlist');
        print( allData);
        notifyListeners();
      });
    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //redirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }
}