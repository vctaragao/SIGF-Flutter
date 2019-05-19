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
  int isDirector;
  int isProfessor;
  int isStudent;

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
      this.isDirector,
      this.isProfessor,
      this.isStudent});

  void show() {
    print(
        "id: $id Name: $name Sex: $sex Course: $course Colar: $colar Birthday: $birthday  Email: $email CPF: $cpf Phone: $phone IsDirector: $isDirector isProfessor: $isProfessor isStudent: $isStudent");
  }
}
