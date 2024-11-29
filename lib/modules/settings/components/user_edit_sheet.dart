import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';
import 'package:provider/provider.dart';

import '../../../components/shared/shared_submit_button.dart';
import '../../../models/user.dart';
import '../../auth/viewmodel/user_viewmodel.dart';

class UserEditSheet extends StatefulWidget {
  final String email;
  final String username;
  final String id;

  const UserEditSheet(
      {super.key,
      required this.email,
      required this.username,
      required this.id});

  @override
  State<UserEditSheet> createState() => _UserEditSheetState();
}

class _UserEditSheetState extends State<UserEditSheet> {
  late final TextEditingController _usernameController;

  @override
  void initState() {
    _usernameController = TextEditingController(text: widget.username);
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Palette.homeBackground,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: Sizes.s54,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                ),
                Positioned(
                    top: Sizes.s0,
                    right: Sizes.s0,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Symbols.close, color: Palette.primary),
                    )),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: context.titleMedium.copyWith(
                      color: Palette.black2422,
                    ),
                  ),
                  const Gap(Sizes.s4),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: "Username",
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                  const Gap(Sizes.s10),
                  Text(
                    "Email",
                    style: context.titleMedium.copyWith(
                      color: Palette.black2422,
                    ),
                  ),
                  const Gap(Sizes.s4),
                  TextField(
                    controller: TextEditingController(text: widget.email),
                    decoration: const InputDecoration(
                      enabled: false,
                      hintText: "email",
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: Sizes.s20),
                  SharedSubmitButton(
                    onPressed: () async {
                      User? user =
                          await context.read<UserViewmodel>().updateUser(
                                widget.id,
                                _usernameController.text,
                              );
                      if (user != null) {
                        Navigator.pop(context, true);
                      }
                    },
                    title: "Update",
                    width: double.infinity,
                    height: Sizes.s54,
                  )
                ],
              ),
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
