import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:crmproject/model/mainuser.dart';
import 'package:crmproject/provider/CategoryProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/Category.dart';
import '../model/Subcategory.dart';
import '../provider/ProjectProvider.dart';
import '../provider/SubcategoryProvider.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

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


  ProjectProvider? obj;
  var selectedValue="";


  CategoryProvider? subobj;
  var cateValue="";

  SubcategoryProvider? mainobj;
  var creatvalue ="";


  Category?  selectedproject;
  Subcategory? selectcategory;
  mainuser? selectsubcategory;

  Getdata() async
  {
    await obj!.Getcategory(context);
  }

  subcatgory() async
  {
    await subobj!.Getsubcategory(context);
  }

  subcate() async
  {
    await mainobj!.maincategory(context);
  }


  @override
  void initState() {
    super.initState();
    obj     =   Provider.of<ProjectProvider>(context, listen: false);
    subobj  =   Provider.of<CategoryProvider>(context, listen: false);
    mainobj =   Provider.of<SubcategoryProvider>(context, listen: false);
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
      return  obj!.allData.where((e) {
        return e.projectName.toString().toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<List<Subcategory>> getcategoryRequestData(String query) async {
    return await Future.delayed(const Duration(seconds: 1), () {
      return  subobj!.allctgry.where((e) {
        return e.categoryName.toString().toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<List<mainuser>> getsubcategoryRequestData(String query) async {
    return await Future.delayed(const Duration(seconds: 1), () {
      return  mainobj!.getdepartmnt.where((e) {
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
                icon: const Icon(Icons.arrow_back,color: Colors.white,),
              ),
              SizedBox(width: 15),
              const Text("Auto Task",style: TextStyle(
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

              Align(
                alignment: Alignment.centerLeft ,
                child: Text("Project Name ",style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              width: MediaQuery.of(context).size.width,
              child: CustomDropdown<Category>.searchRequest(
                futureRequest: getFakeRequestData,
                listItemBuilder: (context, item, isSelected, onItemSelect){
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
              SizedBox(height: 5),

              Align(
                alignment: Alignment.centerLeft ,
                child: Text("Category Name ",style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                width: MediaQuery.of(context).size.width,
                child: CustomDropdown<Subcategory>.searchRequest(
                  futureRequest: getcategoryRequestData,
                  listItemBuilder: (context, item, isSelected, onItemSelect){
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
              SizedBox(height: 5),

              Align(
                alignment: Alignment.centerLeft ,
                child: Text("Sub-Category Name ",style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                width: MediaQuery.of(context).size.width,
                child: CustomDropdown<mainuser>.searchRequest(
                  futureRequest: getsubcategoryRequestData,
                  listItemBuilder: (context, item, isSelected, onItemSelect){
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
              SizedBox(height: 5),


              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft ,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Start Date",style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Select Time",
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: (){
                      _selectedDate(context);
                    },
                    icon: Icon(Icons.date_range_sharp),
                  ),
                  border: OutlineInputBorder(),
                ),
                controller: _date,
              ),
              SizedBox(height: 5),

              Align(
                alignment: Alignment.centerLeft ,
                child: Text("Time Period ",style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                width: MediaQuery.of(context).size.width,
                child: CustomDropdown<String>.searchRequest(
                  futureRequest:getdata,
                  items: items,
                  listItemBuilder: (context, item, isSelected, onItemSelect){
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
              SizedBox(height: 5),

              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff009688)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Text("Save",style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 20.0,
                          ),
                        ),
                      ),
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
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xffFFFFFF)),
                        ),
                        child: Text("Cancel",style: TextStyle(
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
