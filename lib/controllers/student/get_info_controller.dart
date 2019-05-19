part of controllers;

abstract class GetInfoController {
  static Future<Student> getStudent({LoginTokenModel token}) async {
    return await http.get('http://192.168.1.4/api/user', headers: {
      "Authorization": "${token.tokenType} ${token.token}",
      "Accept": "application/json"
    }).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw new Exception("Error while fetching data $statusCode");
      }
      var studentData = json.decode(response.body);
      // Map<String, dynamic> student = {
      //   "id": studentData['id'],
      //   "name": studentData['name'],
      //   "sex": studentData['sex'],
      //   "cpf": studentData['cpf'],
      //   "email": studentData['email'],
      //   "birthday": studentData['birthday'],
      //   "phone": studentData['phone'],
      //   "course": studentData['course'],
      //   "colar": studentData['colar'],
      //   "profile": studentData['profile'],
      //   "isDirector": studentData['isDirector'],
      //   "isProfessor": studentData['isProfessor'],
      //   "isStudent": studentData['isStudent'],
      // };
      // saveCurrentStudent(student);
      return Student(
        id: studentData['id'],
        name: studentData['name'],
        sex: studentData['sex'],
        cpf: studentData['cpf'],
        email: studentData['email'],
        birthday: studentData['birthday'],
        phone: studentData['phone'],
        course: studentData['course'],
        colar: studentData['colar'],
        profile: studentData['profile'],
        isDirector: studentData['isDirector'],
        isProfessor: studentData['isProfessor'],
        isStudent: studentData['isStudent'],
      );
    });
  }
}
