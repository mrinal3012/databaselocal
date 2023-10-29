import 'package:databaselocal/contact.dart';
import 'package:databaselocal/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class NewContact extends StatefulWidget {
  const NewContact({super.key});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {

  TextEditingController _nameController =TextEditingController();
  TextEditingController _phoneController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Data")),),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              label: Text("Name"),
              helperText: "please Enter name",
              prefixIcon: Icon(Icons.person)
              ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              label: Text("Name"),
              helperText: "please Enter phone",
              prefixIcon: Icon(Icons.call)
              ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: () async {
                MyDbHelper.createContact(Contact(
                  name: "mrinal", phone: '0151251254'));
                  Navigator.pop(context);
              }, child: Text("Save Contact"))
          ],
        ),
      ),
    );
  }
}