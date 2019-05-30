part of views;

class ProfilePage extends StatelessWidget {
  List<dynamic> studentValues;
  List<String> studentProp;
  Map<String, dynamic> student;
  List<Widget> listView = [];

  ProfilePage([student]) {
    student = student;
    studentValues = List.from(student.values);
    studentProp = List.from(student.keys);

    for (int i = 0; i < studentProp.length; i++) {
      listView.add(
          ListTile(title: Text("${studentProp[i]} : ${studentValues[i]}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Navbar"),
        ),
        body: ListView(
          children: listView,
        ));
  }
}
