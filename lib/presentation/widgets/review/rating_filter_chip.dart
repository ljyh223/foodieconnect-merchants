import 'package:flutter/material.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';

class RatingFilterChip extends StatelessWidget {
  final int? selectedRating;
  final Function(int?) onFilterChanged;

  const RatingFilterChip({
    super.key,
    required this.selectedRating,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          _buildChoiceChip(
            context,
            label: t.review.allRatings,
            value: null,
            isSelected: selectedRating == null,
            theme: theme,
          ),
          const SizedBox(width: 8),
          ...List.generate(5, (index) {
            final rating = 5 - index;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _buildChoiceChip(
                context,
                label: '$rating★',
                value: rating,
                isSelected: selectedRating == rating,
                theme: theme,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildChoiceChip(
    BuildContext context, {
    required String label,
    required int? value,
    required bool isSelected,
    required ThemeData theme,
  }) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        // Only trigger change if this chip is being selected (not deselected)
        // This prevents the filter from flickering or clearing unexpectedly
        if (selected) {
          onFilterChanged(value);
        }
      },
      selectedColor: theme.colorScheme.primaryContainer,
      labelStyle: TextStyle(
        color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
      ),
    );
  }
}
