import 'package:flutter/material.dart';

import '../../Models/dashboard_model.dart';

class AllCategoriesWidget extends StatelessWidget {
  const AllCategoriesWidget({Key? key, required this.categoryList})
      : super(key: key);

  final CategoryList categoryList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Image.network(
                categoryList.categoryImage ?? '',
              ),
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            flex: 1,
            child: Text(
              categoryList.categoryName ?? '',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
