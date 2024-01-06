import 'package:flutter/material.dart';

class Viewpage extends StatefulWidget {
  const Viewpage({super.key});

  @override
  State<Viewpage> createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage> {
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
              ),),
              Spacer(),
              IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.search, color: Colors.white,),
              ),
              IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.add, color: Colors.white,),
              ),
            ],
          )),
      body:  SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rtrdet",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child:Image.asset("img/editdelete.png"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Text("Category Name:",style: TextStyle(
                      fontSize: 20.0
                    ),),
                    Text("Sub-Category Name:",style: TextStyle(
                        fontSize: 20.0
                    ),),
                    Text("Start Date:",style: TextStyle(
                        fontSize: 20.0
                    ),),
                    Text("Time Period:",style: TextStyle(
                        fontSize: 20.0
                    ),),
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
