part of views;

class ProfilePage extends StatelessWidget {
  var student;
  List<dynamic> studentInfo;

  ProfilePage({this.student}) {
    studentInfo = student.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navbar"),
      ),
      body: ListView.builder(
        itemCount: studentInfo.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(studentInfo[index]));
        },
      ),
    );
  }
}
