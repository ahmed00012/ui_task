import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          _btn('Done', AppColors.green),
          const SizedBox(width: 8),
          _btn('Cancel', AppColors.grey),
          const Spacer(),
          const Text('Order# 987987987   Table TG-T10'),
        ],
      ),
    );
  }

  Widget _btn(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}
