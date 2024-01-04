import 'dart:convert';
import 'package:crmproject/helpers/ApiHandler.dart';
import 'package:crmproject/helpers/ErrorHandler.dart';
import 'package:crmproject/model/Category.dart';
import 'package:crmproject/resources/UrlResources.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  List<Category> data = [];
  var selectedOption = '';
  // Category data = Category();
  Future<void> getData() async {
    var token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJTdW1pdCIsIkdJRCI6IjQyNGFkNmQ1LTBlZTEtNDU3Zi04NWIzLTAxYjI1ZGEwYjdjZSIsImp0aSI6IjRmYmJjYThjLTY0ZTgtNDdiZS1iZDNmLWI5YzUyZTJhM2Q0NCIsImlkIjoiNDg0IiwiUmVnaWQiOiI4IiwicGFja2FnZWlkIjoiIiwiY3VzdGlkIjoiU1VNMDQ3IiwiZmlyc3RuYW1lIjoiU3VtaXQiLCJsYXN0bmFtZSI6IlZhZGhpeWFyYSIsIm1vYmlsZSI6Ijk0ODQ1NzMyOTQiLCJlbWFpbCI6InN1bWl0QGdtYWlsLmNvbSIsInVzZXJuYW1lIjoiU3VtaXQiLCJyb2xlIjoiQWRtaW4iLCJsb2dpbnRpbWUiOiIwOC0xMi0yMDIzIDEwOjU5OjMwIiwiZXhwIjoxNzA0NjkxNzcwLCJpc3MiOiJodHRwOi8vVGF4ZmlsZUNybUdTVC5jb20iLCJhdWQiOiJodHRwOi8vVGF4ZmlsZUNybUdTVC5jb20ifQ.xJsUndfZO4fpUesgpUi6biBt3bR3UsGszIUOpJ1tPmg';

    try
    {
      var response = await http.get(Uri.parse('http://www.taxfilecrm.taxfile.co.in/api/Master/CategoryList?CompanyID=819'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      // print('Token : ${token}');
      data = (jsonDecode(response.body) as List).map((json) => Category.fromJson(json)).toList();
      debugPrint(data.toString());
    }
    catch (e)
    {
      e.toString();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  // List<Category>? allData;
  //
  // Future<void> Getcategory() async {
  //   var token =
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJTdW1pdCIsIkdJRCI6IjQyNGFkNmQ1LTBlZTEtNDU3Zi04NWIzLTAxYjI1ZGEwYjdjZSIsImp0aSI6IjRmYmJjYThjLTY0ZTgtNDdiZS1iZDNmLWI5YzUyZTJhM2Q0NCIsImlkIjoiNDg0IiwiUmVnaWQiOiI4IiwicGFja2FnZWlkIjoiIiwiY3VzdGlkIjoiU1VNMDQ3IiwiZmlyc3RuYW1lIjoiU3VtaXQiLCJsYXN0bmFtZSI6IlZhZGhpeWFyYSIsIm1vYmlsZSI6Ijk0ODQ1NzMyOTQiLCJlbWFpbCI6InN1bWl0QGdtYWlsLmNvbSIsInVzZXJuYW1lIjoiU3VtaXQiLCJyb2xlIjoiQWRtaW4iLCJsb2dpbnRpbWUiOiIwOC0xMi0yMDIzIDEwOjU5OjMwIiwiZXhwIjoxNzA0NjkxNzcwLCJpc3MiOiJodHRwOi8vVGF4ZmlsZUNybUdTVC5jb20iLCJhdWQiOiJodHRwOi8vVGF4ZmlsZUNybUdTVC5jb20ifQ.xJsUndfZO4fpUesgpUi6biBt3bR3UsGszIUOpJ1tPmg';
  //   try {
  //     var headers = {
  //       "Content-Type": "application/json",
  //       'Authorization': 'Bearer $token',
  //     };
  //
  //     var a = await ApiHandler.getRequest(UrlResources.Get, headers);
  //     allData = a.map<Category>((obj) => Category.fromJson(obj)).toList();
  //     print('printlist');
  //     print(allData);
  //   }
  //   on ErrorHandler catch (ex)
  //   {
  //     if (ex.message.toString() == "Internet Connection Failure") {
  //       //redirect to no internet page
  //     } else if (ex.message.toString() == "Bad Response Format") {
  //       //redirect to support page
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: data.length,
              //     itemBuilder: (context, index) {
              //       return Text(data[index].projectName ?? '');
              //     },
              //   ),
              // ),
              // DropdownButtonFormField<String>(
              //   // value: _selectedOption,
              //   hint: Text('Select an option'), // Placeholder or hint text
              //   items: data.map((value) {
              //     return DropdownMenuItem<String>(
              //       value: value.projectName,
              //       child: Text(value.projectName ?? ''),
              //     );
              //   }).toList(),
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       selectedOption = newValue ?? '';
              //     });
              //   },
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     contentPadding: EdgeInsets.symmetric(horizontal: 10),
              //   ),
              // ),
              Align(
                alignment: Alignment.centerLeft ,
                child: Text("Project Name ",style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 5),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                items: data.map((value) {
                  return DropdownMenuItem<String>(
                    value: value.projectName,
                    child: Text(value.projectName ?? ''
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue ?? '';
                  });
                },
                decoration: InputDecoration(
                  hintText: "Default Department",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_drop_down,color: Colors.black45,
                  ),
                  iconSize: 28,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}