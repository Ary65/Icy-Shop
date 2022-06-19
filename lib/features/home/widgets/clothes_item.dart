// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icy_shop/features/details/screens/detail_screen.dart';
import 'package:icy_shop/features/details/widgets/detail_appbar.dart';
import 'package:icy_shop/models/product.dart';

class ClothesItem extends StatefulWidget {
  final String title;
  final int id;
  final double price;
  final String image;
  ClothesItem({
    Key? key,
    required this.title,
    required this.id,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  State<ClothesItem> createState() => _ClothesItemState();
}

class _ClothesItemState extends State<ClothesItem> {
  Product? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  title: widget.title != null ? widget.title : '',
                  image: widget.image != null ? widget.image : '',
                ),
              ));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 170,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // image: DecorationImage(
                      //   image: Image.network(image),
                      //   fit: BoxFit.fitHeight,
                      // ),
                    ),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                      right: 20,
                      top: 15,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          'assets/icons/red-heart.svg',
                          width: 20,
                          color: Colors.red,
                        ),
                      ))
                ],
              ),
              SizedBox(
                width: 180,
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                ),
              ),
              Text(
                widget.id.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
              ),
              Text(
                '\$${widget.price.toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
