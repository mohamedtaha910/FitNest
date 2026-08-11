import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.bodyPart, required this.icon});
  final String bodyPart;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300.withAlpha(200),
          width: 0.6,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
              // borderRadius: BorderRadius.circular(42),
            ),
            child: Image.asset(icon, height: 52),
          ),
          const SizedBox(width: 14),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.46,
            child: Text(
              maxLines: 2,
              bodyPart,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          Spacer(),
          const Icon(
            Icons.chevron_right_rounded,
            color: Colors.black54,
            size: 24,
          ),
        ],
      ),
    );
  }
}
