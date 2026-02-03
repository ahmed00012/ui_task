import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/top_bar.dart';
import '../widgets/guest_column.dart';
import '../models/order_item.dart';
import '../widgets/order_summary_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // مثال على العناصر
  final List<OrderItem> items = [
    OrderItem(name: 'Heineken Btl', price: 150.75, qtyGuest1: 1, qtyGuest2: 1),
    OrderItem(name: 'Coca Cola', price: 25.50, qtyGuest1: 0, qtyGuest2: 2),
    OrderItem(name: 'Pepsi', price: 20.0, qtyGuest1: 2, qtyGuest2: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const TopBar(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    GuestColumn(
                        title: 'Guest 01', items: items, guestNumber: 1),
                    const SizedBox(width: 12),
                    GuestColumn(
                        title: 'Guest 02', items: items, guestNumber: 2),
                    const SizedBox(width: 12),
                    GuestColumn(
                        title: 'Full Table', items: items, guestNumber: 0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
