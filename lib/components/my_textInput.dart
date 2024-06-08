import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool forPassword;
  final String hintText;
  final String label;
  final Icon icon;
  const MyTextInput({
    super.key,
    required this.textEditingController,
    required this.forPassword,
    required this.hintText,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                String error = forPassword
                    ? "Please enter your password"
                    : "Please enter your ${label.toLowerCase()}";
                return error;
              }
              return null;
            },
            controller: textEditingController,
            obscureText: forPassword,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                suffixIcon: icon,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
