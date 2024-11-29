import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../models/entities/instruction.dart';
import 'components/instruction_item.dart';

class FactsScreen extends StatelessWidget {
  FactsScreen({super.key});

  final List<Instruction> instructionList = [
    Instruction("Definition:", [
      "Laced drugs are substances that have been intentionally contaminated or mixed with other substances. This can be done to increase the drug's effects, bulk up the product, or increase profits for dealers.",
    ]),
    Instruction("Common Additives:", [
      "Fentanyl: Often added to heroin, cocaine, and other drugs to enhance potency. It is extremely potent and can easily cause overdose.",
      "Levamisole: A veterinary dewormer sometimes found in cocaine.",
      "Benzodiazepines: Such as alprazolam (Xanax), which may be added to enhance or alter effects.",
      "Other drugs: Such as methamphetamine, MDMA, and various prescription medications."
    ]),
    Instruction("Risks and Dangers:", [
      "Overdose: Increased risk due to unpredictable potency and effects of the added substances.",
      "Health complications: Some additives can cause severe health issues, including organ damage, infection, and other long-term health effects.",
      "Unknown reactions: Users may have unexpected and dangerous reactions due to the unknown substances mixed into the drug."
    ]),
    Instruction("Prevalence:", [
      "Laced drugs have become increasingly common, particularly with the rise of synthetic opioids like fentanyl being mixed into various street drugs.",
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: instructionList.length,
        padding: const EdgeInsets.fromLTRB(Sizes.s20, 0, Sizes.s20, Sizes.s30),
        itemBuilder: (ctx, i) => InstructionItem(
          instruction: instructionList[i],
        ),
        separatorBuilder: (ctx, i) => const SizedBox(height: Sizes.s20),
      ),
    );
  }
}
