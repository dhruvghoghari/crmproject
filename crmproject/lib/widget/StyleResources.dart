import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StyleResources {


  static coustomText(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold
      ),),
    );
  }


  static customButton( VoidCallback onPressed, String text)
  {
    return ElevatedButton(
      onPressed: (){

    },
      style: ElevatedButton.styleFrom(
        primary: Color(0xff009688),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(text,style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }


  static customToast( String text)
  {
    return Fluttertoast.showToast(
        msg: "",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}
  //
  // static coustomDropdown(String text)
  // {
  //
  //   ProjectProvider? obj;
  //   var selectedValue="";
  //
  //   Category?  selectedproject;
  //
  //
  //   Future<List<Category>> getFakeRequestData(String query) async {
  //     return await Future.delayed(const Duration(seconds: 1), () {
  //       return  obj!.allData.where((e) {
  //         return e.projectName.toString().toLowerCase().contains(query.toLowerCase());
  //       }).toList();
  //     });
  //   }
  //
  //
  //   return   Container(
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black),
  //     ),
  //     width: MediaQuery.of(context).size.width,
  //     child: CustomDropdown<Category>.searchRequest(
  //       futureRequest: getFakeRequestData,
  //       listItemBuilder: (context, item, isSelected, onItemSelect){
  //         return Text(item.projectName.toString());
  //       },
  //       headerBuilder: (context, selectedItem) {
  //         return Text(selectedproject != null ? selectedproject!.projectName.toString() : 'select Project');
  //       },
  //       items: obj!.allData,
  //       onChanged: (Category? newValue) {
  //         setState(() {
  //           selectedproject = newValue!;
  //         });
  //       },
  //       excludeSelected: false,
  //       hintText: "Default Department",
  //     ),
  //   );
  // }



