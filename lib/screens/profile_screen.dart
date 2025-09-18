import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Text("My Profile"),
      ),),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.only(top: 25,left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
         spacing: 9,
          children: [
          Row(
            children: [
              Text("Name",style: TextStyle(color: Colors.grey,fontSize: 15),),
            ],
          ),
          Row(
            children: [
              Text("John Mathew",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Text("Phone",style: TextStyle(color: Colors.grey,fontSize: 15),),
            ],
          ),
          Row(
            children: [
              Text("+91 9477575738",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            ],
          )
        ],),
      ),),
    );
  }
}