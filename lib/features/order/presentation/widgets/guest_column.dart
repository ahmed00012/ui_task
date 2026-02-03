import 'package:flutter/material.dart';
import 'order_item_card.dart';
import 'order_summary_widget.dart';
import '../models/order_item.dart';
import '../../../../core/theme/app_colors.dart';

class GuestColumn extends StatelessWidget {
  final String title;
  final List<OrderItem> items;
  final int guestNumber; // 1 = Guest 01, 2 = Guest 02, 0 = Full Table

  const GuestColumn({
    super.key,
    required this.title,
    required this.items,
    required this.guestNumber,
  });

  @override
  Widget build(BuildContext context) {
    double total = 0;
    int totalQty = 0;

    List<OrderItem> displayedItems = [];

    if (guestNumber == 0) {
      displayedItems = items;
      total = items.fold(0, (sum, e) => sum + e.totalPrice);
      totalQty = items.fold(0, (sum, e) => sum + e.totalQty);
    } else {
      displayedItems = items
          .where((e) => (guestNumber == 1 ? e.qtyGuest1 > 0 : e.qtyGuest2 > 0))
          .toList();
      total = items.fold(
          0,
          (sum, e) =>
              sum + ((guestNumber == 1 ? e.qtyGuest1 : e.qtyGuest2) * e.price));
      totalQty = items.fold(
          0, (sum, e) => sum + (guestNumber == 1 ? e.qtyGuest1 : e.qtyGuest2));
    }

    return Container(
      width: 300,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: displayedItems.length,
              itemBuilder: (context, index) {
                final item = displayedItems[index];
                int qty = guestNumber == 1
                    ? item.qtyGuest1
                    : guestNumber == 2
                        ? item.qtyGuest2
                        : item.totalQty;
                return OrderItemCard(item: item, qty: qty);
              },
            ),
          ),
          OrderSummaryWidget(total: total),
        ],
      ),
    );
  }
}
