import 'package:flutter/material.dart';

class SplitItemCard extends StatelessWidget {
  // إضافة المتغيرات التي سيستقبلها الكلاس
  final int qty;
  final String itemName;
  final String price;

  const SplitItemCard({
    super.key,
    required this.qty, // الكمية مطلوبة
    this.itemName = 'Heineken Btl', // قيمة افتراضية
    this.price = '150.750', // قيمة افتراضية
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // عرض الكمية والاسم بشكل ديناميكي
          Text(
            '$qty X $itemName',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4CAF50), // اللون الأخضر من الصورة
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
