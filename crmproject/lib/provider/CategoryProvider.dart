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

      await ApiHandler.getRequest(UrlResources.Get).then((json) async {
        allData = json.map<Category>((obj) => Category.fromJson(obj)).toList();
        var selected = allData!.first!.id.toString();
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