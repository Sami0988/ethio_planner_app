import 'package:ethio_planner/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/repositories/search_repository.dart';
import '../providers/search_providers.dart';
import '../widgets/search_result_tile.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  static Future<void> show(BuildContext context) {
    return Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const SearchPage()));
  }

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final TextEditingController _searchController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(searchControllerProvider.notifier)
          .setRepository(ref.read(searchRepositoryProvider));
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchControllerProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: l10n.searchHint,
            border: InputBorder.none,
          ),
          onChanged: (query) {
            ref.read(searchControllerProvider.notifier).search(query);
          },
        ),
        actions: [
          if (state.query.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                ref.read(searchControllerProvider.notifier).clearSearch();
              },
              tooltip: l10n.clearSearch,
            ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.query.isEmpty
          ? _SearchHints()
          : state.results.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 64,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.searchNoResults,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.searchTryDifferent,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FilterBar(
                  filters: state.filters,
                  onTypesChanged: ref.read(searchControllerProvider.notifier).setTypeFilter,
                  onDateRangeChanged: ref.read(searchControllerProvider.notifier).setDateRange,
                  onCategoryChanged: ref.read(searchControllerProvider.notifier).setCategory,
                  onClearFilters: ref.read(searchControllerProvider.notifier).clearFilters,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.sm,
                    AppSpacing.lg,
                    AppSpacing.sm,
                  ),
                  child: Text(
                    l10n.searchResultsCount(state.results.length),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: state.results.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final result = state.results[index];
                      return SearchResultTile(result: result);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class _SearchHints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.searchAcrossData,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.searchHint,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterBar extends StatefulWidget {
  const _FilterBar({
    required this.filters,
    required this.onTypesChanged,
    required this.onDateRangeChanged,
    required this.onCategoryChanged,
    required this.onClearFilters,
  });

  final SearchFilters filters;
  final void Function(Set<SearchResultType>?) onTypesChanged;
  final void Function(SearchDateRange?) onDateRangeChanged;
  final void Function(String?) onCategoryChanged;
  final VoidCallback onClearFilters;

  @override
  State<_FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<_FilterBar> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final hasFilters = widget.filters.types != null ||
        widget.filters.dateRange != null ||
        widget.filters.category != null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            children: [
              Icon(
                Icons.filter_list,
                size: 20,
                color: hasFilters
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                l10n.searchFilterTypes,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: hasFilters
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
              if (hasFilters) ...[
                const SizedBox(width: AppSpacing.sm),
                GestureDetector(
                  onTap: widget.onClearFilters,
                  child: Text(
                    l10n.searchClearFilters,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              IconButton(
                icon: Icon(
                  _expanded ? Icons.expand_less : Icons.expand_more,
                  size: 20,
                ),
                onPressed: () => setState(() => _expanded = !_expanded),
                tooltip: _expanded ? l10n.collapseFilters : l10n.expandFilters,
              ),
            ],
          ),
        ),
        if (_expanded) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.searchFilterTypes,
                  style: theme.textTheme.labelSmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.xs,
                  children: SearchResultType.values.map((type) {
                    final isSelected = widget.filters.types?.contains(type) ?? false;
                    return FilterChip(
                      label: Text(_typeName(type, l10n)),
                      selected: isSelected,
                      onSelected: (selected) {
                        final current = widget.filters.types ?? {};
                        final updated = Set<SearchResultType>.from(current);
                        if (selected) {
                          updated.add(type);
                        } else {
                          updated.remove(type);
                        }
                        widget.onTypesChanged(
                          updated.isEmpty ? null : updated,
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.date_range, size: 16),
                        label: Text(
                          widget.filters.dateRange != null
                              ? '${widget.filters.dateRange!.start.month}/${widget.filters.dateRange!.start.day} – ${widget.filters.dateRange!.end.month}/${widget.filters.dateRange!.end.day}'
                              : l10n.searchFilterDateRange,
                        ),
                        onPressed: _selectDateRange,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: DropdownButtonFormField<String>(
                          initialValue: widget.filters.category,
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          hint: Text(l10n.searchFilterCategory),
                          items: [
                            DropdownMenuItem(child: Text(l10n.searchAll)),
                            const DropdownMenuItem(value: 'work', child: Text('Work')),
                            const DropdownMenuItem(value: 'personal', child: Text('Personal')),
                            const DropdownMenuItem(value: 'other', child: Text('Other')),
                          ],
                          onChanged: widget.onCategoryChanged,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        if (_expanded || hasFilters)
          const Divider(height: 1),
      ],
    );
  }

  String _typeName(SearchResultType type, AppLocalizations l10n) {
    switch (type) {
      case SearchResultType.event:
        return l10n.searchTypeEvents;
      case SearchResultType.reminder:
        return l10n.searchTypeReminders;
      case SearchResultType.plannerItem:
        return l10n.searchTypePlanner;
      case SearchResultType.note:
        return l10n.searchTypeNotes;
    }
  }

  Future<void> _selectDateRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
      initialDateRange: widget.filters.dateRange != null
          ? DateTimeRange(
              start: widget.filters.dateRange!.start,
              end: widget.filters.dateRange!.end,
            )
          : null,
    );
    if (picked != null) {
      widget.onDateRangeChanged(
        SearchDateRange(start: picked.start, end: picked.end),
      );
    }
  }
}
