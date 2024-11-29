import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

class SharedRadioButtonGroup extends StatefulWidget {
  final String title;
  final List<String> options;
  final double scale;
  final String? initialValue;
  final ValueChanged<String?> onChanged;

  const SharedRadioButtonGroup({
    super.key,
    required this.title,
    required this.options,
    this.scale = 1.15,
    this.initialValue,
    required this.onChanged,
  });

  @override
  _SharedRadioButtonGroupState createState() => _SharedRadioButtonGroupState();
}

class _SharedRadioButtonGroupState extends State<SharedRadioButtonGroup> {
  String? _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: context.displaySmall
              .copyWith(fontSize: Sizes.s14, color: Palette.black4546),
        ),
        const SizedBox(height: 10.0),
        for (var option in widget.options)
          Transform.scale(
            scale: widget.scale,
            child: RadioListTile<String>(
              title: Text(
                option,
                style: context.titleSmall,
              ),
              value: option,
              groupValue: _selectedType,
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
                widget.onChanged(value);
              },
            ),
          ),
      ],
    );
  }
}
