import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icy_shop/common/widgets/loader.dart';
import 'package:icy_shop/features/home/services/product_services.dart';
import 'package:icy_shop/features/home/widgets/clothes_item.dart';
import 'package:icy_shop/features/home/widgets/sub_widgets/categories_list.dart';
import 'package:icy_shop/models/clothes.dart';
import 'package:icy_shop/models/product.dart';

class NewArrival extends StatefulWidget {
  // final clothesList = Clothes.generateClothes();
  NewArrival({Key? key}) : super(key: key);

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  List<Product>? products;
  final ProductServices productServices = ProductServices();
  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await productServices.fetchAllProducts(context);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Column(
            children: [
              const CategoriesList(title: 'New Arrival'),
              SizedBox(
                height: 280,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final productData = products![index];
                    return ClothesItem(
                      title: productData.title,
                      id: productData.id,
                      price: productData.price,
                      image: productData.image,
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: products!.length,
                ),
              )
            ],
          );
  }
}
