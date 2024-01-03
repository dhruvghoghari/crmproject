import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/CategoryProvider.dart';


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


  CategoryProvider? provider;
  var selected="";

  Getcategory() async
  {
    await provider!.Getcategory(context);
    // setState(() {
    //   selected = provider!.allData!.first!.id.toString();
    // });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<CategoryProvider>(context,listen: false);
    Getcategory();
  }


  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: "Default Department",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  )).toList(),
                  validator: (value)
                  {
                    if (value == null) {
                      return 'Please select Project Name.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
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
                SizedBox(height: 5),

                Align(
                  alignment: Alignment.centerLeft ,
                  child: Text("Category Name ",style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: "Select Category Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                    value: selected,
                    child: Text(item,style: const TextStyle(
                      fontSize: 14,
                    ),
                    ),
                  )).toList(),
                  validator: (value)
                  {
                    if (value == null) {
                      return 'Please select Category Name.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
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
                SizedBox(height: 5),

                Align(
                  alignment: Alignment.centerLeft ,
                  child: Text("Sub-Category Name ",style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: "Select Position Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                    value: selected,
                    child: Text(item,style: const TextStyle(
                      fontSize: 14,
                    ),
                    ),
                  )).toList(),
                  validator: (value)
                  {
                    if (value == null) {
                      return 'Please Enter Position Name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
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

                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft ,
                  child: Text("Sub-Category Name ",style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: "Enter Sub-Category Name ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                    value: selected,
                    child: Text(item,style: const TextStyle(
                      fontSize: 14,
                    ),
                    ),
                  )).toList(),
                  validator: (value)
                  {
                    if (value == null) {
                      return 'Please Enter Sub-Category Name ';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
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

                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft ,
                  child: Text("Time Period ",style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: "Select Time Period",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                    value: selected,
                    child: Text(item,style: const TextStyle(
                      fontSize: 14,
                    ),
                    ),
                  )).toList(),
                  validator: (value)
                  {
                    if (value == null) {
                      return 'Please Enter Sub-Category Name ';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
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


                Align(
                  alignment: Alignment.centerLeft ,
                  child: Text("testing",style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(height: 5),
                DropdownButton(
                  isExpanded: true,
                  value: selected,
                  onChanged: (val) {
                    setState(() {
                      selected = val!;
                    });
                  },
                  items: provider!.allData?.map((obj) {
                    return DropdownMenuItem(
                      child: Text(provider!.title.toString()),
                      value: obj.id.toString(),
                    );
                  }).toList() ,
                ),
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
                          child: Text("Save",
                            style: TextStyle(
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
                          child: Text("Cancel",
                            style: TextStyle(
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
      ),
    );
  }
}
