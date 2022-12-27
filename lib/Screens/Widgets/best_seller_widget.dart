import 'package:flutter/material.dart';

import '../../Models/dashboard_model.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({Key? key, required this.sallerProductList})
      : super(key: key);

  final SallerProductList sallerProductList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            // borderRadius: BorderRadius.all(
            //   Radius.circular(10),
            // ),
          ),
          child: Image.network(
            sallerProductList.productImage ?? '',
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 150,
          height: 40,
          child: Text(
            sallerProductList.productName ?? '',
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          width: 150,
          // margin: const EdgeInsets.all(14.0),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Theme.of(context).primaryColor,
              border: Border.all(color: Theme.of(context).primaryColor)),
          child: Center(
            child: Text(
              "Subscribe@ ${sallerProductList.offerPrice}",
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 150,
          // margin: const EdgeInsets.all(14.0),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              // color: Theme.of(context).primaryColor,
              border: Border.all(color: Theme.of(context).primaryColor)),
          child: const Center(
            child: Text(
              'Buy Once',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
