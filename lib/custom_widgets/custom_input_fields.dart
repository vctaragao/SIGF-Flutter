part of custom_widgets;

typedef String CustomValidator(String value);

class InputFields extends StatelessWidget {
  final String helperText;
  final TextInputType textInputType;
  final String labelText;
  final bool obscureText;
  final TextEditingController textController;
  final CustomValidator validator;

  InputFields(
      {this.labelText,
      this.textInputType,
      this.obscureText: false,
      this.textController,
      this.helperText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textController,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        labelText: labelText,
        hintText: helperText,
      ),
      keyboardType: textInputType,
      obscureText: obscureText,
    );
  }
}
