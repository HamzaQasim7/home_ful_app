import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_dynamic_icon.dart';
import 'package:home_ful/components/shared/shared_submit_button.dart';
import 'package:home_ful/core/constants/constants.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.s8),
      ),
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: const SharedDynamicIcon(
              SvgAssets.alertOctagon,
              width: Sizes.s48,
              height: Sizes.s48,
            ),
          ),
          const Gap(Sizes.s20),
          Text(
            "Are you sure?",
            style: context.headlineMedium
                .copyWith(color: Palette.black, fontSize: 18),
          ),
          const Gap(Sizes.s10),
          Text(
            "By pressing yes, your reserved bed will be de-selected and assigned to someone else.",
            style: context.titleSmall.copyWith(color: Palette.grey5050),
            textAlign: TextAlign.center,
          ),
          const Gap(Sizes.s30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Yes button
              SharedSubmitButton(
                height: Sizes.s54,
                width: Sizes.s120,
                onPressed: () {},
                title: 'Yes',
              ),
              const Gap(Sizes.s8),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        color: Palette.primary), // Border color
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: const Size(Sizes.s120, Sizes.s54)),
                child: const Text(
                  "No",
                  style: TextStyle(
                    color: Palette.primary,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
