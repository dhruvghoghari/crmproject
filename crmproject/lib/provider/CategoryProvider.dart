import 'package:crmproject/helpers/ApiHandler.dart';
import 'package:crmproject/helpers/ErrorHandler.dart';
import 'package:crmproject/model/Category.dart';
import 'package:crmproject/resources/UrlResources.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier
{

  List<Category> allData =[];


  Future<void> Getcategory(context) async {
    try
    {

     var headers=
     {
     "Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJQcmluY2U5OSIsIkdJRCI6IjhkNDVkYzQ3LTZmMjktNGViMy1hM2VlLTQ0Y2FiZTU1MWE1OCIsImp0aSI6ImU3MGU1MTFmLTFmY2QtNDc4ZC05NmFmLWQ2MzIyZjJiOGMxOSIsImlkIjoiNTg4IiwiUmVnaWQiOiI4IiwicGFja2FnZWlkIjoiIiwiY3VzdGlkIjoiUHJpNzc1IiwiZmlyc3RuYW1lIjoiUHJpbmNlICIsImxhc3RuYW1lIjoiUGF0ZWwiLCJtb2JpbGUiOiIxMjM0NTY3ODkwIiwiZW1haWwiOiJQcmluY2UxMkBnbWFpbC5jb20iLCJ1c2VybmFtZSI6IlByaW5jZTk5Iiwicm9sZSI6IkFkbWluIiwibG9naW50aW1lIjoiMDQtMDEtMjAyNCAxNTo0NTowNSIsImV4cCI6MTcwNzA0MTcwNSwiaXNzIjoiaHR0cDovL1RheGZpbGVDcm1HU1QuY29tIiwiYXVkIjoiaHR0cDovL1RheGZpbGVDcm1HU1QuY29tIn0.CrVAAr7TNnVVpc_hhS7qe5cdb7x186LTtg8nEZ3TthE"
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