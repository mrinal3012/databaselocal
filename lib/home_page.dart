import 'package:databaselocal/contact.dart';
import 'package:databaselocal/db_helper.dart';
import 'package:databaselocal/new_contact.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("DataBase")),),


     body:FutureBuilder(
        future: MyDbHelper.readContact(), 
      builder: 
      (BuildContext context, 
      AsyncSnapshot<List<Contact>> snapshot){
        if (snapshot.connectionState==ConnectionState.waiting) { // Check if there is no data yet
      return Center(child: CircularProgressIndicator()) ;
    }else if(!snapshot.hasData){
      return Center(child: Text("No data available"));
    }else if(snapshot == null){
      return Center(child: Text("snapshot data are null"));
    }
    return 
        
        ListView(children: snapshot.data!.map((e) => Center(
          child: ListTile(
            title: Text(e.name),
            subtitle: Text(e.phone),
            trailing: IconButton(onPressed: () {
              
            }, icon: Icon(Icons.delete)),
          ),
        )
        ).toList()
        );
      }
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewContact(),));
        setState(() {
          
        });
      },child: Icon(Icons.add),),
      
    );
  }
}