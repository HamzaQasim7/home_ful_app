import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.resourceFinancial);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300, width: 0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.s20, vertical: Sizes.s12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Image(image: AssetImage(ImageAssets.homeCar)),
                ),
                const SizedBox(height: 10),
                Text(
                  'City Center Garage',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff040108),
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  '909-1/2 E 49th St Los Angeles, California(CA)',
                  style:
                      context.titleSmall.copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Color(0xff505050)),
                    const SizedBox(width: 8),
                    Text(
                      'Available now',
                      style: context.titleSmall
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.attach_money, color: Color(0xff505050)),
                    const SizedBox(width: 8),
                    Text(
                      'Hourly: \$2, Daily: \$10',
                      style: context.titleSmall
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.phone, color: Color(0xff505050)),
                    const SizedBox(width: 8),
                    Text(
                      '(123) 456-7890',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff0F0F0F),
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
