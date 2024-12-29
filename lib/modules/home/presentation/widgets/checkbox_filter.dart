import 'package:flutter/material.dart';

class CheckboxFilter extends StatelessWidget {
  const CheckboxFilter(
      {super.key,
      required this.status,
      required this.statusValue,
      required this.text});
  final ValueNotifier<String?> status;
  final String statusValue;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        ValueListenableBuilder(
          valueListenable: status,
          builder: (context, value, child) {
            return Checkbox(
              value: status.value == statusValue,
              onChanged: (value) {
                if (status.value != statusValue) {
                  status.value = statusValue;
                } else {
                  status.value = null;
                }
              },
            );
          },
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
