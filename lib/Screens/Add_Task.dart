import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _TaskApp();
  }

}

class _TaskApp extends State<AddTask>{
  final _formKey = GlobalKey<FormState>();
  String task_name = "";
  DateTime task_date = DateTime.now();
  TextEditingController _datecontroller = TextEditingController();

  final DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  _handledatepicker() async
  {
   final DateTime dateTime = await showDatePicker(context: context,
       initialDate: DateTime.now(),
       firstDate: DateTime(1900),
       lastDate: DateTime(2100));

   if(dateTime!=null)
     {
       setState(() {
         task_date = dateTime;
       });
       _datecontroller.text = dateFormat.format(task_date);
     }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(top: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.arrow_back_ios,size: 20,)),
                onTap: ()
            {
              Navigator.pop(context);
            }

            ),

            Container(
              margin: EdgeInsets.all(10),
              child: Text("Add Task",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30
              ),),
            ),

            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          task_name = value;
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Task",

                        ),

                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Task Description",

                        ),

                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: TextFormField(
                        controller: _datecontroller,
                        onTap: _handledatepicker,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter date';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Date",

                        ),
                        keyboardType: TextInputType.number,

                      ),
                    ),


                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: DropdownButtonFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Priority",

                        ), items: <String>['High', 'Medium', 'Low', ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                        onChanged: (_) {},

                      ),
                    ),


                         Center(
                        child: Container(
                          margin: EdgeInsets.all(20),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {


                                }
                              },

                              color: Colors.red,
                              textColor: Colors.white,
                              child: Text("Done"),
                              padding: EdgeInsets.all(16),

                            )
                        )
                    ),

                      ],
                    )

                ),
              ),


          ],
        ),
      ),
      ),
    );
  }


}