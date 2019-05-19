part of custom_widgets;

class InputFields extends StatelessWidget {
  final String helperText;
  final TextInputType textInputType;
  final String labelText;
  final bool obscureText;
  final TextEditingController textController;

  InputFields(
      {this.labelText,
      this.textInputType,
      this.obscureText: false,
      this.textController,
      this.helperText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
