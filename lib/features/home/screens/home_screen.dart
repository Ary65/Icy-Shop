import 'package:flutter/material.dart';
import 'package:icy_shop/common/widgets/custom_app_bar.dart';
import 'package:icy_shop/constants/colors.dart';
import 'package:icy_shop/features/home/widgets/best_sell.dart';
import 'package:icy_shop/features/home/widgets/new_arrival.dart';
import 'package:icy_shop/features/home/widgets/search_input.dart';

class HomeScreen extends StatelessWidget {
  final bottomList = ['home', 'menu', 'heart', 'user'];
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: backgroundGradient,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(),
              SearchInput(),
              NewArrival(),
              const BestSell(),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: bottomList
              .map(
                (e) => BottomNavigationBarItem(
                  label: e,
                  icon: Image.asset(
                    'assets/icons/$e.png',
                    width: 25,
                  ),
                ),
              )
              .toList()),
    );
  }
}
