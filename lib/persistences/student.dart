// part of persistences;

// Future<void> saveCurrentStudent(Map<String, dynamic> student) async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();

//   List<String> strStudent = List<String>.from(student.values);

//   await preferences.setInt('currentUserId',
//       (student['id'] != null && student['id'] > 0) ? student['id'] : "");
//   await preferences.setStringList('currentUserInfo', strStudent);
// }

// Future<Map<String, dynamic>> getCurrentUser() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String strStudent = prefs.getString('currentUserInfo');

//   // Map<String, dynamic> currenToken = {
//   //   "token": token,
//   //   "tokenType": tokenType,
//   //   "expiresIn": expiresIn,
//   // };

//   // return currenToken;
// }
