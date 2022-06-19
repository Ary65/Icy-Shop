// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:icy_shop/constants/color_picker.dart';
import 'package:icy_shop/constants/colors.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  final String image;

  const DetailsScreen({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List<Color> colors = [
    const Color(0xFFF6CFC6),
    const Color(0xFFEEDFB5),
    const Color(0xFFCAE2C5),
    const Color(0xFFBAE6EE)
  ];
  int _currentPage = 0;
  int _currentColor = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // return Scaffold(
    // appBar: AppBar(
    //   title: Text(widget.title),
    // ),
    // body: SizedBox(
    //   height: size.height * 0.2,
    //   width: size.width,
    //   child: Image.network(
    //     widget.image,
    //     fit: BoxFit.fitHeight,
    //   ),
    // ),
    return Container(
      decoration: const BoxDecoration(
        gradient: backgroundGradient,
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.image),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          // Positioned(
          //   top: 530,
          //   child: Container(
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       child: Text(
          //         widget.title,
          //         overflow: TextOverflow.ellipsis,
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          Positioned(
            bottom: 30,
            left: 180,
            child: Row(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(shape: BoxShape.circle),
              )
            ]),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 175,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30)),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentColor = index;
                    });
                  },
                  child: ColorPicker(
                      outerBorder: _currentColor == index,
                      color: colors[index]),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 3,
                ),
                itemCount: colors.length,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.orange,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.orange,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
