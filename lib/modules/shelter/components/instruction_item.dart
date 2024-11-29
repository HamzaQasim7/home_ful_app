import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../../models/entities/instruction.dart';

class InstructionItem extends StatelessWidget {
  final int? index;
  final Instruction instruction;
  const InstructionItem({super.key, this.index, required this.instruction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          index != null ? "${(index! + 1)}. ${instruction.title}" : instruction.title,
          style: context.displaySmall.copyWith(
            fontSize: Sizes.s14,
            fontWeight: FontWeight.w800,
            color: Palette.black2422,
          ),
        ),
        // const Gap(Sizes.s20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: instruction.descList
              .map(
                (e) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(Sizes.s10),
                    const Text("•"),
                    const Gap(Sizes.s10),
                    Expanded(
                      child: Text(
                        e,
                        style: context.bodyMedium.copyWith(color: Palette.black4947),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
