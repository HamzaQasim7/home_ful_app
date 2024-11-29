import 'package:flutter/material.dart';
import 'package:home_ful/core/constants/constants.dart';

import '../../components/shared/shared_appbar.dart';
import '../../components/shared/shared_dynamic_icon.dart';
import '../../components/shared/shared_submit_button.dart';
import '../shelter/shelter_item_screen.dart';
import 'components/counter_row_widget.dart';

class ReservingDetailScreen extends StatelessWidget {
  const ReservingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppbar(
        title: "Back",
        color: Palette.black2422,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(Sizes.s10),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3),
                  topRight: Radius.circular(3),
                ),
                child: SharedDynamicIcon(
                  ImageAssets.building,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: context.height * 0.25,
                ),
              ),
              const Gap(Sizes.s20),
              Text(
                'Reserving for 28th Aug , 2024',
                style: context.headlineMedium.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const Gap(Sizes.s4),
              const InfoRow(
                  icon: Image(
                    color: Colors.grey,
                    image: AssetImage(ImageAssets.mapPin),
                  ),
                  text: '909-1/2 E 49th St Los Angeles,California(CA)'),
              const Gap(Sizes.s14),
              Text(
                "Estimated arrival time",
                style: context.displaySmall
                    .copyWith(fontSize: Sizes.s14, color: Palette.black4546),
              ),
              const Gap(Sizes.s10),
              Container(
                decoration: BoxDecoration(
                    color: Palette.greyf5f7,
                    border: Border.all(color: Palette.greyE6EA)),
                child: DropdownButtonFormField<String>(
                  items:
                      ['30 mint', '50 mint', '1 hour'].map((String category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.s0, vertical: Sizes.s0),
                  isExpanded: true,
                  value: '30 mint',
                  onChanged: (value) {},
                ),
              ),
              const Gap(Sizes.s14),
              Text(
                "No of beds required",
                style: context.displaySmall
                    .copyWith(fontSize: Sizes.s14, color: Palette.black4546),
              ),
              const Gap(Sizes.s10),
              Container(
                decoration: BoxDecoration(
                    color: Palette.greyf5f7,
                    border: Border.all(color: Palette.greyE6EA)),
                child: DropdownButtonFormField<String>(
                  items: ['1 bed', '2 bed', '3 bed', '4 bed', '5 bed']
                      .map((String category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.s0, vertical: Sizes.s0),
                  isExpanded: true,
                  value: '1 bed',
                  onChanged: (value) {},
                ),
              ),
              const Gap(Sizes.s20),
              Container(
                width: context.width,
                height: context.height * 0.22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Palette.white,
                  border: Border.all(color: Palette.greyEFD),
                ),
                child: Column(
                  children: [
                    CounterRow(
                      title: 'Adults',
                      description: 'Age 18 or above',
                      count: 0,
                      onIncrement: () {},
                      onDecrement: () {},
                    ),
                    const Divider(color: Palette.greyEFD),
                    CounterRow(
                      title: 'Children',
                      description: 'Below 18 years',
                      count: 0,
                      onIncrement: () {},
                      onDecrement: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    fixedSize: const Size(double.infinity, Sizes.s54),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  // Navigator.pushNamed(context, Routes.standBy);
                },
                child: Text(
                  'Get direction',
                  style: context.displaySmall.copyWith(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(width: Sizes.s10), // Add spacing between buttons
            Expanded(
              child: SharedSubmitButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.bunkBedScreen);
                },
                title: "Confirm",
                width: double.infinity,
                height: Sizes.s54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.grey[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: const Text(
              'Adults',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Age 18 or above',
              style: TextStyle(color: Colors.grey[600]),
            ),
            trailing: SizedBox(
              width: 120,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_circle_outline),
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '0',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline),
                    color: Colors.deepPurple,
                  )
                ],
              ),
            ),
          ),
          CounterWidget(
            title: 'Adults',
            subtitle: 'Age 18 or above',
          ),
          const SizedBox(height: 16),
          CounterWidget(
            title: 'Children',
            subtitle: 'Below 18 years',
          ),
        ],
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  final String title;
  final String subtitle;

  CounterWidget({super.key, required this.title, required this.subtitle});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 0) _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: _decrement,
                color: _count > 0 ? Colors.grey : Colors.grey[300],
              ),
              const SizedBox(width: 8),
              Text(
                '$_count',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _increment,
                color: Colors.purple,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
