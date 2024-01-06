import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:crmproject/model/mainuser.dart';
import 'package:crmproject/provider/CategoryProvider.dart';
import 'package:crmproject/widget/StyleResources.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/Category.dart';
import '../model/Subcategory.dart';
import '../provider/AuthProvider.dart';
import '../provider/ProjectProvider.dart';
import '../provider/SubcategoryProvider.dart';


class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final TextEditingController _date = TextEditingController();
  DateTime? selectedDate;
  Future<void> _selectedDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat("dd-MM-yyyy").format(pickedDate);
      setState(() {
        selectedDate = pickedDate;
        _date.text = formattedDate.toString();
      });
    }
  }

  AuthProvider? provider;
  ProjectProvider? obj;
  var selectedValue = "";


  CategoryProvider? subobj;
  var cateValue = "";

  SubcategoryProvider? mainobj;
  var creatvalue = "";


  Category? selectedproject;
  Subcategory? selectcategory;
  mainuser? selectsubcategory;

  Getdata() async {
    await obj!.Getcategory(context);
  }

  subcatgory() async {
    await subobj!.Getsubcategory(context);
  }

  subcate() async {
    await mainobj!.maincategory(context);
  }


  @override
  void initState() {
    super.initState();
    obj = Provider.of<ProjectProvider>(context, listen: false);
    subobj = Provider.of<CategoryProvider>(context, listen: false);
    mainobj = Provider.of<SubcategoryProvider>(context, listen: false);
    Getdata();
    subcatgory();
    subcate();
  }

  var items = [
    'Daily',
    'Monthly',
    'Quarterly',
    'Semiannually',
    'Annually',
  ];
  var selectitem;

  Future<List<Category>> getFakeRequestData(String query) async {
    return await Future.delayed(const Duration(seconds: 1), () {
      return obj!.allData.where((e) {
        return e.projectName.toString().toLowerCase().contains(
            query.toLowerCase());
      }).toList();
    });
  }

  Future<List<Subcategory>> getcategoryRequestData(String query) async {
    return await Future.delayed(const Duration(seconds: 1), () {
      return subobj!.allctgry.where((e) {
        return e.categoryName.toString().toLowerCase().contains(
            query.toLowerCase());
      }).toList();
    });
  }

  Future<List<mainuser>> getsubcategoryRequestData(String query) async {
    return await Future.delayed(const Duration(seconds: 1), () {
      return mainobj!.getdepartmnt.where((e) {
        return e.heading.toString().toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<List<String>> getdata(String query) async {
    await Future.delayed(const Duration(seconds: 1));
    return items.where((e) {
      return e.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: const Color(0xff009688),
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white,),
              ),
              SizedBox(width: 15),
              const Text("Auto Task", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),)
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [

              StyleResources.coustomText("Project Name"),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(0.3),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(0.20)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: CustomDropdown<Category>.searchRequest(
                    futureRequest: getFakeRequestData,
                    listItemBuilder: (context, item, isSelected, onItemSelect) {
                      return Text(item.projectName.toString());
                    },
                    headerBuilder: (context, selectedItem) {
                      return Text(selectedproject != null ? selectedproject!.projectName.toString() : 'select Project');
                    },
                    items: obj!.allData,
                    onChanged: (Category? newValue) {
                      setState(() {
                        selectedproject = newValue!;
                      });
                    },
                    excludeSelected: false,
                    hintText: "Default Department",
                  ),
                ),
              ),
              SizedBox(height: 5),


              StyleResources.coustomText("Category Name"),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(0.3),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(0.20)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: CustomDropdown<Subcategory>.searchRequest(
                    futureRequest: getcategoryRequestData,
                    listItemBuilder: (context, item, isSelected, onItemSelect) {
                      return Text(item.categoryName.toString());
                    },
                    headerBuilder: (context, selectedItem) {
                      return Text(selectcategory != null ? selectcategory!.categoryName.toString() : 'select Project');
                    },
                    items: subobj!.allctgry,
                    onChanged: (Subcategory? newValue) {
                      setState(() {
                        selectcategory = newValue;
                      });
                    },
                    excludeSelected: false,
                    hintText: "Select Category Name ",
                  ),
                ),
              ),
              SizedBox(height: 5),

              StyleResources.coustomText("Sub-Category Name"),
              SizedBox(height: 5),
              Padding (
                padding: const EdgeInsets.all(0.3),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(0.20)
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: CustomDropdown<mainuser>.searchRequest(
                    futureRequest: getsubcategoryRequestData,
                    listItemBuilder: (context, item, isSelected, onItemSelect) {
                      return Text(item.heading.toString());
                    },
                    headerBuilder: (context, selectedItem) {
                      return Text(selectsubcategory != null ? selectsubcategory!.heading.toString() : 'select Project');
                    },
                    items: mainobj!.getdepartmnt,
                    onChanged: (mainuser? newValue) {
                      setState(() {
                        selectsubcategory = newValue;
                      });
                    },
                    excludeSelected: false,
                    hintText: "Select Sub-Category Name",
                  ),
                ),
              ),
              SizedBox(height: 5),


              StyleResources.coustomText("Start Date"),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  hintText: "Select Time",
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _selectedDate(context);
                    },
                    icon: Icon(Icons.date_range_sharp),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.20)
                  ),
                ),
                controller: _date,
              ),
              SizedBox(height: 5),

              StyleResources.coustomText("Time Period"),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(0.3),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(0.20)
                  ),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: CustomDropdown<String>.searchRequest(
                    futureRequest: getdata,
                    items: items,
                    listItemBuilder: (context, item, isSelected, onItemSelect) {
                      return Text(item.toString());
                    },
                    onChanged: (String? newValue) {
                      setState(() {
                        selectitem = newValue;
                      });
                    },
                    hintText: "Select Time Period ",
                  ),
                ),
              ),
              SizedBox(height: 5),


              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                     child: StyleResources.customButton(() async{

                        var projectName = getFakeRequestData.toString();
                        var categoryName = getcategoryRequestData.toString();
                        var subcategoryName = getsubcategoryRequestData.toString();
                        var date = _date.text.toString();
                        var timePeriod = getdata.toString();


                        var params =
                        {
                          "name": projectName,
                          "categoryName": categoryName,
                          "subcategoryName": subcategoryName,
                          "date": date,
                          "timePeriod": timePeriod,
                        };

                        await provider?.addInsert(context, params);
                        if
                        (provider!.isinserted)
                        {
                          var snackbar = SnackBar(
                          content: Text("Add Data Successfully"));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                        else
                        {
                          var snackbar = SnackBar(
                          content: Text("Add Data UnSuccessfully"));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                        
                        StyleResources.customToast("Please Select Category ");
                     },"Submit"),
                      
                      
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff009688)),
                        borderRadius: BorderRadius.circular(10.0),),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffFFFFFF)),
                        ),
                        child: Text("Cancel", style: TextStyle(
                          color: Color(0xff009688),
                          fontSize: 20.0,
                        ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import '../provider/ProjectProvider.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   DateTime? selectedDate;
//   Future<void> _selectedDate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//
//     if (pickedDate != null) {
//       String formattedDate = DateFormat("dd-MM-yyyy").format(pickedDate);
//       setState(() {
//         selectedDate = pickedDate;
//         _date.text = formattedDate.toString();
//       });
//     }
//   }
//
//   var department="sale";
//   var selected="";
//
//
//
//   final TextEditingController _pname = TextEditingController();
//   final TextEditingController _cname = TextEditingController();
//   final TextEditingController _sname = TextEditingController();
//   final TextEditingController _subname = TextEditingController();
//   final TextEditingController _date = TextEditingController();
//   final TextEditingController _time = TextEditingController();
//
//
//
//    CategoryProvider? provider;
//
//    Getcategory() async
//    {
//      await provider!.Getcategory(context);
//    }
//
//
//    @override
//    void initState() {
//      // TODO: implement initState
//      super.initState();
//      provider = Provider.of<CategoryProvider>(context,listen: false);
//      Getcategory();
//    }
//
//
//   @override
//   Widget build(BuildContext context) {
//     provider = Provider.of<CategoryProvider>(context,listen: true);
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         backgroundColor: Color(0xff009688),
//           title: Row(
//         children: [
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: Icon(Icons.arrow_back,color: Colors.white,),
//           ),
//           SizedBox(width: 15),
//           Text("Auto Task",style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//             color: Colors.white,
//           ),)
//         ],
//       )),
//       body:  SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(10.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft ,
//                   child: Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Text("Project Name ",style: TextStyle(
//                       fontSize: 15.0,
//                       fontWeight: FontWeight.bold
//                     ),),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(5.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Default Department",
//                       border: OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.keyboard_arrow_down_rounded,size: 30.0,),
//                         onPressed: () {
//
//                           DropdownButton(
//                             value: department,
//                             onChanged: (val)
//                             {
//                               setState(() {
//                                 department=val!;
//                               });
//                             },
//                             items: [
//                               DropdownMenuItem(
//                                 child: Text("Sale"),
//                                 value: "sale",
//                               ),
//                               DropdownMenuItem(
//                                 child: Text("Purchase"),
//                                 value: "pr",
//                               ),
//                               DropdownMenuItem(
//                                 child: Text("Profit"),
//                                 value: "pt",
//                               ),
//                               DropdownMenuItem(
//                                 child: Text("pf"),
//                                 value: "pf",
//                               )
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                     controller: _pname,
//                     keyboardType: TextInputType.text,
//                   ),
//                 ),
//
//                 Align(
//                   alignment: Alignment.centerLeft ,
//                   child: Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Text("Category Name",style: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold
//                     ),),
//                   ),
//                 ),
//                 GestureDetector(onTap: (){
//
//                 },
//                   child: Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: TextField(
//                       decoration: InputDecoration(
//                           hintText: "Select Category Name",
//                           border: OutlineInputBorder(),
//                         suffixIcon: IconButton(
//                           icon: Icon(Icons.keyboard_arrow_down_rounded,size: 30.0,),
//                           onPressed: () {
//                             // Handle the button press if needed
//                           },
//                         ),
//                       ),
//                       controller: _cname,
//                       keyboardType: TextInputType.text,
//                     ),
//                   ),
//                 ),
//
//                 Align(
//                   alignment: Alignment.centerLeft ,
//                   child: Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Text("Sub-Category Name ",style: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold
//                     ),),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(5.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         hintText: "Enter Position Name",
//                         border: OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.keyboard_arrow_down_rounded,size: 30.0,),
//                         onPressed: () {
//
//                         },
//                       ),
//                     ),
//                     controller: _sname,
//                     keyboardType: TextInputType.text,
//                   ),
//                 ),
//
//                 Align(
//                   alignment: Alignment.centerLeft ,
//                   child: Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Text("Sub-Category Name",style: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold
//                     ),),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(5.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         hintText: "Select Sub-Category Name",
//                         border: OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.keyboard_arrow_down_rounded,size: 30.0,),
//                         onPressed: () {
//                           // Handle the button press if needed
//                         },
//                       ),
//                     ),
//                     controller: _subname,
//                     keyboardType: TextInputType.text,
//                   ),
//                 ),
//
//                 Align(
//                   alignment: Alignment.centerLeft ,
//                   child: Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Text("Start Date",style: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold
//                     ),),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         suffixIcon: IconButton(
//                           onPressed: (){
//                             _selectedDate(context);
//                           },
//                           icon: Icon(Icons.date_range_sharp),
//                         ),
//                         border: OutlineInputBorder(
//                         )
//                     ),
//                     controller: _date,
//                     keyboardType: TextInputType.datetime,
//                   ),
//                 ),
//
//                 Align(
//                   alignment: Alignment.centerLeft ,
//                   child: Padding(
//                     padding: EdgeInsets.all(5.0),
//                     child: Text("Time Period",style: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold
//                     ),),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(5.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         hintText: "Select Time Period",
//                         border: OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.keyboard_arrow_down_rounded,size: 30.0,),
//                         onPressed: () {
//                           // Handle the button press if needed
//                         },
//                       ),
//                     ),
//                     controller: _time,
//                     keyboardType: TextInputType.text,
//                   ),
//                 ),
//
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: DropdownButton(
//                   value: selected,
//                   onChanged: (val)
//                   {
//                     setState(() {
//                       selected=val!;
//                     });
//                   },
//                   items:Getcategory!.map(obj)
//                     {
//                       return
//                     }
//                 ),
//               ),
//
//
//                 SizedBox(height: 10.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Your "Save" button click logic here
//                           },
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(Color(0xff009688)),
//                           ),
//                           child: Text("Save",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 20.0,),
//                     Expanded(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Your "Cancel" button click logic here
//                           },
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(Color(0xffDC3545)),
//                           ),
//                           child: Text("Cancel",style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }