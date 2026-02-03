import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class SplitActions extends StatelessWidget {
  final VoidCallback onSave;

  const SplitActions({
    super.key,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // ✅ محاذاة على اليمين
      children: [
        /// 🔘 Cancel Button
        SizedBox(
          width: 100, // ✅ حجم أصغر
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade600,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 14, // أصغر حجم نص
                fontWeight: FontWeight.bold, // bold
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        /// 🟢 Save Button
        SizedBox(
          width: 100, // ✅ حجم أصغر
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onSave,
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 14, // أصغر حجم نص
                fontWeight: FontWeight.bold, // bold
              ),
            ),
          ),
        ),
      ],
    );
  }
}
