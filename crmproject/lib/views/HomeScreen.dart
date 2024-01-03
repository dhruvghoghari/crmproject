import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/CategoryProvider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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

  var department="sale";
  var selected="";



  final TextEditingController _pname = TextEditingController();
  final TextEditingController _cname = TextEditingController();
  final TextEditingController _sname = TextEditingController();
  final TextEditingController _subname = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();



   CategoryProvider? provider;

   Getcategory() async
   {
     await provider!.Getcategory(context);
   }


   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     provider = Provider.of<CategoryProvider>(context,listen: false);
     Getcategory();
   }


  @override
  Widget build(BuildContext context) {
    provider = Provider.of<CategoryProvider>(context,listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xff009688),
          title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          SizedBox(width: 15),
          Text("Auto Task",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),)
        ],
      )),
      body:  SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft ,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Project Name ",style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Default Department",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.keyboard_arrow_down_rounded,size: 30.0,),
                        onPressed: () {

                          DropdownButton(
                            value: department,
                            onChanged: (val)
                            {
                              setState(() {
                                department=val!;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                child: Text("Sale"),
                                value: "sale",
                              ),
                              DropdownMenuItem(
                                child: Text("Purchase"),
                                value: "pr",
                              ),
                              DropdownMenuItem(
                                child: Text("Profit"),
                                value: "pt",
                              ),
                              DropdownMenuItem(
                                child: Text("pf"),
                                value: "pf",
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    controller: _pname,
                    keyboardType: TextInputType.text,
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft ,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Category Name",style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                GestureDetector(onTap: (){

                },
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Select Category Name",
                          border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.keyboard_arrow_down_rounded,size: 30.0,),
                          onPressed: () {
                            // Handle the button press if needed
                          },
                        ),
                      ),
                      controller: _cname,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft ,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Sub-Category Name ",style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Position Name",
                        border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.keyboard_arrow_down_rounded,size: 30.0,),
                        onPressed: () {
                          
                        },
                      ),
                    ),
                    controller: _sname,
                    keyboardType: TextInputType.text,
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft ,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Sub-Category Name",style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Select Sub-Category Name",
                        border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.keyboard_arrow_down_rounded,size: 30.0,),
                        onPressed: () {
                          // Handle the button press if needed
                        },
                      ),
                    ),
                    controller: _subname,
                    keyboardType: TextInputType.text,
                  ),
                ),

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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: (){
                            _selectedDate(context);
                          },
                          icon: Icon(Icons.date_range_sharp),
                        ),
                        border: OutlineInputBorder(
                        )
                    ),
                    controller: _date,
                    keyboardType: TextInputType.datetime,
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft ,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Time Period",style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Select Time Period",
                        border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.keyboard_arrow_down_rounded,size: 30.0,),
                        onPressed: () {
                          // Handle the button press if needed
                        },
                      ),
                    ),
                    controller: _time,
                    keyboardType: TextInputType.text,
                  ),
                ),

              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   child: DropdownButton(
              //     value: selected,
              //     onChanged: (val)
              //     {
              //       setState(() {
              //         selected=val!;
              //       });
              //     },
              //     items:Getcategory!.map(obj)
              //       {
              //         return
              //       }
              //   ),
              // ),


                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            // Your "Save" button click logic here
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff009688)),
                          ),
                          child: Text("Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            // Your "Cancel" button click logic here
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xffDC3545)),
                          ),
                          child: Text("Cancel",style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),


                    // Align(
                    //   alignment: Alignment.centerLeft ,
                    //   child: Text("testing",style: TextStyle(
                    //       fontSize: 15.0,
                    //       fontWeight: FontWeight.bold
                    //   ),),
                    // ),
                    // SizedBox(height: 5),
                    // DropdownButton(
                    //   isExpanded: true,
                    //   value: selected,
                    //   onChanged: (val) {
                    //     setState(() {
                    //       selected = val!;
                    //     });
                    //   },
                    //   items: provider!.allData?.map((obj) {
                    //     return DropdownMenuItem(
                    //       child: Text(obj.title.toString()),  // Access the title property directly
                    //       value: obj.id.toString(),
                    //     );
                    //   })?.toList() ?? [],
                    //
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
