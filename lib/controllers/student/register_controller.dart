part of controllers;

abstract class RegisterController {
  static Future<LoginTokenModel> register(Map<String, dynamic> data) async{

    try{
      return await http.post(LaravelAPI.urlApi + LaravelAPI.apiRoutes['register'],
      headers: {

      },body: {

      }
      );
    }catch
  }
}
