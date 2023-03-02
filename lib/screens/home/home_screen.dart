import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../../components/card_widgets.dart';
import '../../components/input_text_widgets.dart';
import '../../components/tablayout_widgets.dart';
import '../../constants/assets_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
              fontFamily: 'PoppinsSemiBold',
              fontSize: 16.px3pt,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 14.px3pt, right: 14.px3pt),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best delivery burguer',
                    style: TextStyle(
                      fontFamily: 'PoppinsSemiBold',
                      color: const Color(0xFFFF9A51),
                      fontSize: 20.px3pt,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  // TODO: add the search event handler here
                  SearchTrackingWidget(
                    onChangeCallback: (value) {},
                    onSearchCallback: () {},
                    hintText: '',
                  ),
                ],
              ),
            ),
            // the list of promotions
            Container(
              margin: EdgeInsets.only(top: 7.px3pt),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 14.px3pt),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Promotions',
                          style: TextStyle(
                            fontSize: 16.px3pt,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PoppinsSemiBold',
                          ),
                        ),
                        IconButton(
                          // TODO: slide to the right of promotions list
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            arrowsIllustration,
                            fit: BoxFit.none,
                            width: 10.px3pt,
                            height: 18.px3pt,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // TODO: add a listview.builder here
                  PromotionsCard(
                    url:
                    'https://docs.flutter.dev/assets/images/docs/ui/layout/layout-4.png',
                    title: 'Hello',
                    description: 'ssss',
                    price: "\$123.9",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 22.px3pt),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 14.px3pt, right: 14.px3pt),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 16.px3pt,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PoppinsSemiBold',
                            color: const Color(0xFF313737),
                          ),
                        ),
                        // TODO: add the click event handler here
                        Text(
                          'See More',
                          style: TextStyle(
                            fontSize: 12.px3pt,
                            fontFamily: 'PoppinsRegular',
                            color: const Color(0xFF313737),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 800.px3pt,
              child: TabLayoutWidget(
                tabs: [
                  Tab(text: 'Tab 1'),
                  Tab(text: 'Tab 2'),
                ],
                tabContents: [
                  Center(child: Text('Content of Tab 1')),
                  Center(child: Text('Content of Tab 2')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
