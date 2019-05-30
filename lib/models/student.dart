part of models;

class Student {
  int id;
  String sex;
  String course;
  String colar;
  String birthday;
  String name;
  String email;
  String cpf;
  String phone;
  String profile;
  int director;
  int professor;
  int student;

  Student(
      {this.id,
      this.birthday,
      this.colar,
      this.course,
      this.cpf,
      this.email,
      this.name,
      this.phone,
      this.sex,
      this.profile,
      this.director,
      this.professor,
      this.student});

  void show() {
    print(
        "id: $id Name: $name Sex: $sex Course: $course Colar: $colar Birthday: $birthday  Email: $email CPF: $cpf Phone: $phone Director: $director Professor: $professor Student: $student");
  }

  Map<String, dynamic> toJson() {
    return {
      "sex": sex,
      "course": course,
      "colar": colar,
      "birthday": birthday,
      "name": name,
      "email": email,
      "cpf": cpf,
      "phone": phone,
      "profile": profile,
    };
  }

  int get getId => id;

  bool isDirector() => this.director == 1 ? true : false;
  bool isProfessor() => this.professor == 1 ? true : false;
  bool isStudent() => this.student == 1 ? true : false;
}
