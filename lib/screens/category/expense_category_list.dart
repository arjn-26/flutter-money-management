//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_management/db/category/category_db.dart';

import '../../models/category/category_model.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryListListener,
      builder: (BuildContext ctx, List<CategoryModel> newlIst, Widget? _) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final category = newlIst[index];
            return Card(
              child: ListTile(
                title: Text(category.name),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: newlIst.length,
        );
      },
    );
  }
}
