import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

class RowTextButton extends StatelessWidget {
  const RowTextButton(
      {super.key,
      required this.title,
      required this.buttonTitle,
      required this.onPress});

  final String title, buttonTitle;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Palette.black2422,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                )),
        TextButton(
          onPressed: onPress,
          child: Text(
            buttonTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Palette.black2422,
                  fontSize: MediaQuery.of(context).size.width * 0.042,
                  decoration: TextDecoration.underline,
                ),
          ),
        )
      ],
    );
  }
}
