import 'package:flutter/material.dart';
import 'package:home_ful/components/shared/shared_dynamic_icon.dart';
import 'package:home_ful/components/shared/shared_submit_button.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../components/shared/shared_appbar.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SharedAppbar(
                  title: 'Confirm your location',
                  color: Palette.black,
                ),
                const Gap(Sizes.s10),
                Container(
                  width: context.width,
                  height: context.height * 0.25,
                  color: Palette.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _locationController,
                        decoration: InputDecoration(
                                prefixIcon: const SharedDynamicIcon(
                                  ImageAssets.mapPin,
                                  width: Sizes.s16,
                                  height: Sizes.s16,
                                  color: Palette.primary,
                                ),
                                hintText: "Enter your address or zip code",
                                hintStyle: context.bodySmall
                                    .copyWith(color: Palette.grey5050))
                            .copyWith(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                      ),
                      const Gap(Sizes.s10),
                      const Divider(color: Palette.greyC8C8),
                      ListTile(
                        onTap: () {},
                        leading: const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: SharedDynamicIcon(ImageAssets.loader),
                        ),
                        title: Text(
                          'Current location',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Palette.primary),
                        ),
                        subtitle: Text('Fetch your current location',
                            style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
          child: SharedSubmitButton(
            width: context.width,
            height: Sizes.s50,
            title: 'Confirm',
            onPressed: () {
              // Navigator.pushReplacementNamed(context, Routes.signUp);
            },
          ),
        ),
      ),
    );
  }
}
