import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../util/formatter/date_time_formatter.dart';
import '../../l10n/l10n.dart';

class AppDatePickerForm extends StatelessWidget {
  const AppDatePickerForm({
    super.key,
    required this.date,
    required this.setDate,
    required this.resetDate,
  });

  final DateTime? date;
  final void Function(DateTime?) setDate;
  final VoidCallback resetDate;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    Future<void> datePick() async {
      final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030, 12, 31),
      );
      setDate(date);
    }

    return Row(
      children: [
        const Icon(Icons.timer_outlined),
        const Gap(16),
        GestureDetector(
          onTap: datePick,
          child:
              date != null
                  ? DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Gap(16),
                        Text(date!.MMMEd()),
                        IconButton(
                          onPressed: resetDate,
                          icon: const Icon(Icons.close, size: 16),
                        ),
                      ],
                    ),
                  )
                  : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(l10n.todoDueDateFormIsEmptyText),
                  ),
        ),
      ],
    );
  }
}
