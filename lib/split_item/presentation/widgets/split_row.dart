import 'package:flutter/material.dart';

class SplitRow extends StatelessWidget {
  final String title;
  final String value;
  final bool danger;
  final bool withControls;

  /// 🆕
  final bool deleteOnly;
  final VoidCallback? onDelete;

  final VoidCallback? onAdd;
  final VoidCallback? onRemove;

  const SplitRow({
    super.key,
    required this.title,
    required this.value,
    this.danger = false,
    this.withControls = false,

    /// 🆕
    this.deleteOnly = false,
    this.onDelete,
    this.onAdd,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Title
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),

          /// 🗑️ Delete only
          if (deleteOnly)
            InkWell(
              onTap: onDelete,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.delete_outline,
                  size: 20,
                  color: Colors.red,
                ),
              ),
            )

          /// ➕➖ Controls
          else if (withControls)
            _controls()

          /// 🔢 Value only
          else
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: danger ? Colors.red : Colors.grey[600],
              ),
            ),
        ],
      ),
    );
  }

  Widget _controls() {
    return Row(
      children: [
        _icon(Icons.remove, onRemove),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.orange[800],
            ),
          ),
        ),
        _icon(Icons.add, onAdd),
      ],
    );
  }

  Widget _icon(IconData icon, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20, color: Colors.grey[600]),
      ),
    );
  }
}
