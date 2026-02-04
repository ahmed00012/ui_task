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
          _btn(
            text: 'Done',
            background: AppColors.green,
            textColor: AppColors.white,
          ),
          const SizedBox(width: 8),
          _btn(
            text: 'Cancel',
            background: AppColors.cancelGrey,
            textColor: AppColors.white,
          ),
          const Spacer(),
          const Text(
            'Order# 987987987   Table TG-T10',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _btn({
    required String text,
    required Color background,
    required Color textColor,
  }) {
    return SizedBox(
      height: 36, // ارتفاع مريح للزر (قريب من Figma)
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700, // Bold
            fontSize: 14,
            height: 1, // Line height 100%
            letterSpacing: 0,
            color: textColor, // أبيض
          ),
        ),
      ),
    );
  }
}
