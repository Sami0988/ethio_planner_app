import 'package:flutter/material.dart';

class PrintPreviewCard extends StatelessWidget {
  const PrintPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(child: Padding(padding: EdgeInsets.all(8), child: Text('Print Preview')));
  }
}
