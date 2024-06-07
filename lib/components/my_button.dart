import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final bool isLoading;
  const MyButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          child: isLoading
              ? const SpinKitWave(
                  color: Colors.white,
                  size: 20.0,
                )
              : Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
