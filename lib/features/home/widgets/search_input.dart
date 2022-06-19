import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInput extends StatelessWidget {
  final tagsList = ['Woman', 'T-Shirt', 'Dress'];

  SearchInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none),
                        hintText: 'Search Asthetic Shirt',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 19,
                        ),
                        prefixIcon: Container(
                            padding: const EdgeInsets.all(15),
                            child: SvgPicture.asset(
                              'assets/icons/search-category.svg',
                              width: 20,
                            ))),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: SvgPicture.asset(
                  'assets/icons/folder-filter.svg',
                  width: 25,
                ),
              )
            ],
          ),
          Row(
              children: tagsList
                  .map((e) => Container(
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // ignore: deprecated_member_use
                            color: Theme.of(context).accentColor),
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
