import 'package:flutter/material.dart';
import '../../../../l10n/generated/app_localizations.dart';

class PlannerCard extends StatelessWidget {
  const PlannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(l10n.plannerItem),
      ),
    );
  }
}
