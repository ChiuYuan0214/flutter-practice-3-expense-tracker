import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.list, required this.onRemove});
  final List<Expense> list;
  final void Function(Expense expense) onRemove;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(list[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          // margin: const EdgeInsets.symmetric(horizontal: 16),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        child: ExpenseItem(list[index]),
        onDismissed: (direction) {
          onRemove(list[index]);
        },
      ),
    );
  }
}
