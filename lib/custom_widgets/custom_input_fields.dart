part of custom_widgets;

typedef String CustomValidator(String value);

class InputFields extends StatelessWidget {
  final String helperText;
  final TextInputType textInputType;
  final String labelText;
  final bool obscureText;
  final TextEditingController textController;
  final CustomValidator validator;
  final bool dense;
  final String format;
  InputFields(
      {this.labelText,
      this.textInputType,
      this.obscureText: false,
      this.textController,
      this.helperText,
      this.validator,
      this.dense = true,
      this.format = ""});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textController,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        labelText: labelText,
        hintText: helperText,
        isDense: dense,
      ),
      keyboardType: textInputType,
      obscureText: obscureText,
      inputFormatters: (format.length > 0)
          ? <TextInputFormatter>[
              _NumericTextFormatter(format: format),
            ]
          : null,
    );
  }
}

/* 
  INPUT MASK
   Define the format you want the mask to be, and put a '#' where you want the numbers to be
*/

class _NumericTextFormatter extends TextInputFormatter {
  final String format;

  _NumericTextFormatter({this.format});

  // String where is stored the current mask String
  String newText;

  // StringBuffer that is used to build the phone with the mask
  StringBuffer str;

  // This method is called everytime a change in the text field happens
  @override
  TextEditingValue formatEditUpdate(
    // Holds the value in the text field when the change was triggerd
    TextEditingValue oldValue,
    // Holds the hole value that you are trying to insert
    TextEditingValue newValue,
  ) {
    /* This if statement exits to prevent the formatEditUpdate to keep calling it self
     when it adds the first '(' to the text field, this way trigerring
     the formatEditUpdate to be called again
    */

    if (newValue.text.length > oldValue.text.length) {
      /** 
       * This i is initialized like this so every time the loop starts,
       * it goes direct to the next mask position that is not yet filled
       */
      int i = oldValue.text.length == 0 ? 0 : oldValue.text.length;

      // Initialize the StringBuffer with the last info in the text field
      str = StringBuffer(oldValue.text);

      for (; i < format.length; i++) {
        if (format[i] == '#') {
          str.write(newValue.text[newValue.text.length - 1]);
          break;
        }
        str.write(format[i]);
      }

      newText = str.toString();

      return TextEditingValue(
        text: newText,
        // This selection part, maskes sure that the cursor come back in the end of the String in the text field
        selection: TextSelection.collapsed(offset: newText.length),
      );

      /**
       *  This else if statement exists, so that we can erase the text field
       *  In case the newValue is equal to the oldValue minus it's last caracter
       */
    } else if (oldValue.text.length > 0 &&
        newValue.text.compareTo(
                oldValue.text.substring(0, oldValue.text.length - 1)) ==
            0) {
      // Return the newValue where the caracter have been erased
      return TextEditingValue(
        text: newValue.text,
        selection: TextSelection.collapsed(offset: newValue.text.length),
      );

      /**  
       * Here the oldValue is return whenever the method is called more than once,
       * stopping the changin on the text field, and, with that, stopping the method
       * from being called non stop.
      */
    } else {
      return TextEditingValue(
        text: oldValue.text,
        selection: TextSelection.collapsed(offset: oldValue.text.length),
      );
    }
  }
}
