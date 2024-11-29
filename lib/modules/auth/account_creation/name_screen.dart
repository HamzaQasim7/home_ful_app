import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:home_ful/modules/auth/account_creation/components/custom_radio_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../components/shared/shared_appbar.dart';
import '../../../components/shared/shared_submit_button.dart';
import '../viewmodel/auth_viewmodel.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
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
                    Navigator.pop(context);
                  },
                ),
              ),
              const Divider(color: Palette.greyE7E7),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SharedSubmitButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: "Confirm",
                  width: double.infinity,
                  height: 54,
                ),
              ),
              const SizedBox(height: 20),
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
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: const SharedAppbar(
        title: "Create account",
        color: Palette.black2422,
        backgroundColor: Palette.white,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  fontSize: 14,
                                  color: Palette.black4546,
                                ),
                          ),
                          const SizedBox(height: 10),
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
                          const SizedBox(height: 10),
                          _buildSectionTitle("What's your date of birth?"),
                          const SizedBox(height: 10),
                          _buildDatePicker(context),
                          const SizedBox(height: 10),
                          SharedRadioButtonGroup(
                            title: 'What\'s your gender?',
                            options: const ['Male', 'Female', 'Others'],
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value ?? 'Male';
                              });
                            },
                            initialValue: selectedValue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SharedSubmitButton(
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        selectedDate != null) {
                      // Pass name, birthday, and gender to the viewmodel
                      authViewModel.setNameAndBirthday(
                        nameController.text,
                        selectedDate!,
                        selectedValue,
                      );
                      // Navigate to the profile image screen
                      Navigator.pushNamed(context, Routes.profileImgScreen);
                    } else if (selectedDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please select a valid date')),
                      );
                    }
                  },
                  title: "Confirm",
                  width: double.infinity,
                  height: 54,
                ),
              ),
              const SizedBox(height: 20),
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
                  : DateFormat.yMMMd().format(selectedDate!),
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
