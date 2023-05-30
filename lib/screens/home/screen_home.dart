import 'package:flutter/material.dart';
import 'package:flutter_money_management/db/category/category_db.dart';
import 'package:flutter_money_management/models/category/category_model.dart';
import 'package:flutter_money_management/screens/category/category_add_popup.dart';
import 'package:flutter_money_management/screens/category/screen_category.dart';
import 'package:flutter_money_management/screens/home/widgets/bottom_navigation.dart';
import 'package:flutter_money_management/screens/transactions/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransactions(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Center(child: Text('MONEY MANAGER')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add transactions');
          } else {
            print('Add categories');

            showCategoryAddPopup(context);
            // final _sample = CategoryModel(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: 'Travel',
            //   type: CategoryType.expense,
            // );
            // CategoryDB().insertCategory(_sample);
          }
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
    );
  }
}
