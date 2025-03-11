import 'package:flutter/material.dart';

class TodaysReportWidget extends StatelessWidget {
  const TodaysReportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Report",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _ReportItem(label: "Total", value: "5"),
              _ReportItem(label: "Taken", value: "3"),
              _ReportItem(label: "Missed", value: "1"),
              _ReportItem(label: "Snoozed", value: "1"),
            ],
          ),
        ],
      ),
    );
  }
}

class _ReportItem extends StatelessWidget {
  final String label;
  final String value;

  const _ReportItem({required this.label, required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: Color(0xFF6886ee), fontSize: 20),
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
