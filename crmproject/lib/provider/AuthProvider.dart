import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../helpers/ApiHandler.dart';
import '../helpers/ErrorHandler.dart';
import '../resources/UrlResources.dart';

class AuthProvider extends ChangeNotifier
{


  bool isinserted=false;
  // var insertmessage="";

  addInsert(context,params) async{
    try
    {
      var herds = {
        "Content-Type":"application/json",
        "Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJQcmluY2U5OSIsIkdJRCI6IjQ3YWJmZmFkLTY3NDEtNDIyMC04OTVhLWYyMTliOWM2ZWMzZSIsImp0aSI6ImNlZmMwYzkxLWIyMDAtNDQ2Ni1hMmRjLTU1N2E0NTU2MmEwZSIsImlkIjoiNTg4IiwiUmVnaWQiOiI4IiwicGFja2FnZWlkIjoiIiwiY3VzdGlkIjoiUHJpNzc1IiwiZmlyc3RuYW1lIjoiUHJpbmNlICIsImxhc3RuYW1lIjoiUGF0ZWwiLCJtb2JpbGUiOiIxMjM0NTY3ODkwIiwiZW1haWwiOiJQcmluY2UxMkBnbWFpbC5jb20iLCJ1c2VybmFtZSI6IlByaW5jZTk5Iiwicm9sZSI6IkFkbWluIiwibG9naW50aW1lIjoiMDYtMDEtMjAyNCAxMTo0OTo1MCIsImV4cCI6MTcwNzIwMDM5MCwiaXNzIjoiaHR0cDovL1RheGZpbGVDcm1HU1QuY29tIiwiYXVkIjoiaHR0cDovL1RheGZpbGVDcm1HU1QuY29tIn0.eMxd1QoXud01z0sWGV70rX2s_w2DyiqdosF9koi4TLs"
      };

      await ApiHandler.postRequest(UrlResources.insert,body: jsonEncode(params),headers: herds).then((json){
         // print(Responsee);
        if(json["Success"]=="false")
        {
          isinserted=true;
        }
        else
        {
          isinserted=false;
        }
      });
    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //redirect to internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }

}
