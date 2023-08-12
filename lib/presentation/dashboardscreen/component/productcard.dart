import 'package:ecommerce_admin/data/datasources/deleteproduct/fetchproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../data/models/productmodel.dart';

class ProductsCard extends StatefulWidget {
  Product product;
  ProductsCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  Deleteroducts deleteproducts = Deleteroducts();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                widget.product.pImg.toString(),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.product.pName.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.deepPurpleAccent,
              ),
              onPressed: () async {
                deleteproducts.deleteProducts(
                    documentId: widget.product.productId, context: context);
              },
            ),
          ],
        ),
        Text(
          widget.product.pPrice.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 15, color: Colors.orange),
        ),
        Row(
          children: [
            RatingBarIndicator(
              rating: double.parse(widget.product.pRating!),
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 17.0,
              direction: Axis.horizontal,
            ),
            const Text(
              '(12)',
              style: TextStyle(color: Colors.grey, fontSize: 11),
            )
          ],
        ),
      ],
    );
  }
}
