import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class OrderSummaryWidget extends StatelessWidget {
  final double total;

  const OrderSummaryWidget({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Total ${total.toStringAsFixed(3)} KD',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
