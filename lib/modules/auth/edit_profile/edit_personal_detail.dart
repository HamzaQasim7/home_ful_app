import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/auth/account_creation/components/custom_radio_button.dart';

import '../../../components/shared/shared_appbar.dart';
import '../../../components/shared/shared_submit_button.dart';

class EditPersonalDetailScreen extends StatefulWidget {
  const EditPersonalDetailScreen({super.key});

  @override
  _EditPersonalDetailScreenState createState() =>
      _EditPersonalDetailScreenState();
}

class _EditPersonalDetailScreenState extends State<EditPersonalDetailScreen> {
  late final TextEditingController nameController;
  final GlobalKey<FormState> formKey = GlobalKey();
  String selectedValue = 'Male';
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  Future<void> _selectDate(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  onDateChanged: (picked) {
                    setState(() {
                      selectedDate = picked;
                    });
                    Navigator.pop(context); // Close the bottom sheet
                  },
                ),
              ),
              const Divider(color: Palette.greyE7E7),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
                child: SharedSubmitButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: "Confirm",
                  width: double.infinity,
                  height: Sizes.s54,
                ),
              ),
              const Gap(20),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(
        title: "Edit profile",
        color: Palette.black2422,
        backgroundColor: Palette.white,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Gap(Sizes.s30),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "What's your name?",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: Sizes.s14,
                                  color: Palette.black4546,
                                ),
                          ),
                          const Gap(Sizes.s20),
                          TextFormField(
                            controller: nameController,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Name cannot be empty';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const Gap(Sizes.s20),
                          _buildSectionTitle("What's your date of birth?"),
                          const Gap(Sizes.s20),
                          _buildDatePicker(context),
                          const Gap(Sizes.s20),
                          SharedRadioButtonGroup(
                            title: 'What\'s your gender?',
                            options: const ['Male', 'Female', 'Others'],
                            onChanged: (String? value) {},
                            initialValue: 'Others',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
                child: SharedSubmitButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, Routes.profileImgScreen);
                    }
                  },
                  title: "Confirm",
                  width: double.infinity,
                  height: Sizes.s54,
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: context.displaySmall
            .copyWith(fontSize: Sizes.s14, color: Palette.black4546));
  }

  Widget _buildDatePicker(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Palette.white,
          border: Border.all(color: Palette.greyE6EA),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? "Select a date"
                  : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
              style: const TextStyle(color: Palette.black),
            ),
            const Icon(Icons.calendar_today,
                color: Palette.black4947, size: 26),
          ],
        ),
      ),
    );
  }
}
