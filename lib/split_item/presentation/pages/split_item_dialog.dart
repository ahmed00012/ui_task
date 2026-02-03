import 'package:flutter/material.dart';
import '../widgets/split_header.dart';
import '../widgets/split_item_card.dart';
import '../widgets/split_row.dart';
import '../widgets/split_actions.dart';
import 'package:pos_app/features/split_item/models/split_result.dart';
import '../../../../core/theme/app_colors.dart';

class SplitItemDialog extends StatefulWidget {
  final int totalQty;

  const SplitItemDialog({super.key, required this.totalQty});

  @override
  State<SplitItemDialog> createState() => _SplitItemDialogState();
}

class _SplitItemDialogState extends State<SplitItemDialog> {
  int guest1 = 0;
  int guest2 = 0;

  int get fullTable => widget.totalQty - (guest1 + guest2);

  void _addGuest1() => setState(() => guest1++);
  void _removeGuest1() {
    if (guest1 > 0) setState(() => guest1--);
  }

  void _addGuest2() => setState(() => guest2++);
  void _removeGuest2() {
    if (guest2 > 0) setState(() => guest2--);
  }

  void _save() {
    final result = SplitResult(
      guest1: guest1,
      guest2: guest2,
      fullTable: fullTable < 0 ? 0 : fullTable,
    );
    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.dialogBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        width: 450,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SplitHeader(),
            const SizedBox(height: 20),
            SplitItemCard(qty: widget.totalQty),
            const SizedBox(height: 20),
            SplitRow(title: 'Full Table', value: fullTable.toString()),
            const Divider(),
            SplitRow(
                title: 'Guest 01',
                value: guest1.toString(),
                withControls: true,
                onAdd: _addGuest1,
                onRemove: _removeGuest1),
            const Divider(),
            SplitRow(
                title: 'Guest 02',
                value: guest2.toString(),
                withControls: true,
                onAdd: _addGuest2,
                onRemove: _removeGuest2),
            const SizedBox(height: 30),
            SplitActions(onSave: _save),
          ],
        ),
      ),
    );
  }
}
