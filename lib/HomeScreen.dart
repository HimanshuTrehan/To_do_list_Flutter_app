import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
   return _HomeState();
  }

}

class _HomeState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,

      ),
      appBar: AppBar(
        title: Center(
          child: Text("Personal Management System"),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(

        itemCount: 10,
        itemBuilder: (context, index) {
          if(index==0)
            {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My task",style: TextStyle(
                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30
                    ),),
                    SizedBox(height: 20,),
                    Text("Task 1 of 10",style: TextStyle(
                        color: Colors.black,fontSize: 15
                    ),),
                  ],
                ),
              );

            }
          return _Taskbuild(index);
        }

        ,),
    );
  }

}

Widget _Taskbuild(int index) {
  return ListTile(
    title: Text("Task $index"),
    subtitle: Text("12-1-2021"),
    trailing: Checkbox(onChanged: (bool value) {  }, value: true,
      activeColor: Colors.red,
      
    ),
  );
}

