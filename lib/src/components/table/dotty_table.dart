import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyTable extends StatelessWidget {
  const DottyTable({
    super.key,
    required this.headers,
    required this.rows,
    this.columnWidths,
  });

  final List<String> headers;
  final List<DottyTableRow> rows;
  final Map<int, TableColumnWidth>? columnWidths;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DottyColors.card,
        border: Border.all(color: DottyColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Table(
        columnWidths: columnWidths,
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: DottyColors.surface.withValues(alpha: 0.5),
            ),
            children: headers
                .map(
                  (h) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    child: Text(
                      h.toUpperCase(),
                      style: DottyTypography.labelSmall.copyWith(
                        color: DottyColors.muted,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          ...rows.map((row) => _buildRow(row)),
        ],
      ),
    );
  }

  TableRow _buildRow(DottyTableRow row) {
    return TableRow(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: DottyColors.border)),
      ),
      children: row.cells
          .map(
            (cell) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: cell,
            ),
          )
          .toList(),
    );
  }
}

class DottyTableRow extends StatelessWidget {
  const DottyTableRow({super.key, required this.cells});

  final List<Widget> cells;

  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}
