import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/top_bar.dart';
import '../widgets/guest_column.dart';
import '../widgets/guest_side_bar.dart';
import '../models/order_item.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // 1️⃣ ScrollController
  final ScrollController _scrollController = ScrollController();

  int selectedGuest = 1;
  List<int> guests = [1, 2];

  final List<OrderItem> items = [
    OrderItem(name: 'Heineken Btl', price: 150.75, qtyGuest1: 1, qtyGuest2: 1),
    OrderItem(name: 'Coca Cola', price: 25.50, qtyGuest1: 0, qtyGuest2: 2),
    OrderItem(name: 'Pepsi', price: 20.0, qtyGuest1: 2, qtyGuest2: 0),
  ];

  // 2️⃣ عرض كل Guest ثابت
  static const double guestWidth = 320;
  static const double spacing = 12;

  // 3️⃣ دالة تحريك الـ Scroll
  void _scrollToGuest(int guestIndex) {
    final offset = guestIndex * (guestWidth + spacing);

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // 5️⃣ لما تضيف Guest جديد → تحرك عليه
  void _addGuest() {
    setState(() {
      final newGuest = guests.length + 1;
      guests.add(newGuest);
      selectedGuest = newGuest;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToGuest(guests.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const TopBar(),
          Expanded(
            child: SingleChildScrollView(
              // 4️⃣ ربط الـ controller
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ...guests.map(
                      (g) {
                        final index = guests.indexOf(g);
                        return Padding(
                          padding: const EdgeInsets.only(right: spacing),
                          child: SizedBox(
                            // 7️⃣ عرض ثابت
                            width: guestWidth,
                            child: GuestColumn(
                              title: 'Guest ${g.toString().padLeft(2, '0')}',
                              items: items,
                              guestNumber: g,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: guestWidth,
                      child: GuestColumn(
                        title: 'Full Table',
                        items: items,
                        guestNumber: 0,
                      ),
                    ),
                    const SizedBox(width: spacing),
                    GuestSideBar(
                      guests: guests,
                      selectedGuest: selectedGuest,
                      // 6️⃣ لما تختار Guest من الـ SideBar
                      onSelectGuest: (g) {
                        setState(() => selectedGuest = g);
                        final index = guests.indexOf(g);
                        if (index != -1) {
                          _scrollToGuest(index);
                        }
                      },
                      onAddGuest: _addGuest,
                    ),
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
