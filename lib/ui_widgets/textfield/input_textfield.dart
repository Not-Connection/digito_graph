part of '_index.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool isObscure;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final String? errorText;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;

  const InputTextField({
    required this.textEditingController,
    required this.focusNode,
    required this.keyboardType,
    this.isObscure = false,
    this.textInputAction = TextInputAction.next,
    required this.onEditingComplete,
    required this.errorText,
    this.suffixIcon,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: isObscure,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        isDense: true,
        errorText: errorText,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        // focusedErrorBorder: ,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 249, 119, 110)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
