import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class GuestSideBar extends StatelessWidget {
  final List<int> guests;
  final int selectedGuest;
  final ValueChanged<int> onSelectGuest;
  final VoidCallback onAddGuest;

  const GuestSideBar({
    super.key,
    required this.guests,
    required this.selectedGuest,
    required this.onSelectGuest,
    required this.onAddGuest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ...guests.map(
            (g) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _guestBtn(g),
            ),
          ),
          const SizedBox(height: 12),
          _iconBtn(Icons.add, onAddGuest),
          const Spacer(),
          _iconBtn(Icons.swap_horiz, () {}),
          const SizedBox(height: 8),
          _iconBtn(Icons.refresh, () {}),
        ],
      ),
    );
  }

  Widget _guestBtn(int index) {
    final bool active = selectedGuest == index;

    return InkWell(
      onTap: () => onSelectGuest(index),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? AppColors.darkText : AppColors.buttonBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          '$index',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: active ? Colors.white : AppColors.darkText,
          ),
        ),
      ),
    );
  }

  Widget _iconBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.buttonBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 22),
      ),
    );
  }
}
