import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../models/order_item.dart';
import '../../../../split_item/presentation/pages/split_item_dialog.dart';

class OrderItemCard extends StatelessWidget {
  final OrderItem item;
  final int qty;

  const OrderItemCard({super.key, required this.item, required this.qty});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await showDialog(
          context: context,
          builder: (_) => SplitItemDialog(totalQty: item.totalQty),
        );

        if (result != null) {
          // تحديث الكميات بعد تقسيم العناصر
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.buttonBackground,
        ),
        child: Row(
          children: [
            Text('$qty X ',
                style: TextStyle(
                    color: AppColors.green, fontWeight: FontWeight.bold)),
            Expanded(child: Text(item.name)),
            Text((item.price * qty).toStringAsFixed(3)),
            const Icon(Icons.more_vert, color: AppColors.green),
          ],
        ),
      ),
    );
  }
}
