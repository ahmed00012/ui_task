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
        _row('Subtotal', '156.000 KD'),
        _row('Discount', '20.500 KD'),
        _row('Service', '2.000 KD'),
        _row('Tax', '10.000 KD'),
        const SizedBox(height: 8),

        /// ✅ Total Button مقسوم لجزئين
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              /// الجزء الأيسر: نص
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Total ${total.toStringAsFixed(3)} KD',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              /// الجزء الأيمن: أيقونة الطباعة
              Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.green.shade700,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.print, color: Colors.white),
                  onPressed: () {
                    // TODO: إضافة وظيفة الطباعة
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _row(String l, String r) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(l), Text(r)]);
  }
}
