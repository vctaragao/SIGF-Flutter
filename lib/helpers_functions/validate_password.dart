part of helpers_functions;

String validatePassword(String value) {
  if (value.isEmpty)
    return 'Por favor preencha esse campo';
  else
    return null;
}
