class Task_Model
{
  int id;
  String title;
  String description;
  String date;
  String priority;
  String status;
  Task_Model(this.title,this.description,this.date,this.priority,this.status);
  Task_Model.withId({this.id,this.title,this.description,this.date,this.priority,this.status});


   Map<String,dynamic> toMap()
  {
    final map = Map<String,dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['date'] = date.toString();
    map['priority'] = priority;
    map['status'] = status;

    return map;
  }

  factory Task_Model.fromMap(Map<String,dynamic> map)
  {
    return Task_Model.withId(id: map['id'],
      title: map['title'],
      description: map['description'],
        date: map['date'],
        priority: map['priority'],
        status: map['status']
    );
  }
}