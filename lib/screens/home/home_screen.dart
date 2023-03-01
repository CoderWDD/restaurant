import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../../constants/assets_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
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
      body: Column(
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
                      color: Color(0xFFFF9A51),
                      fontSize: 20.px3pt,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 22.px3pt),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF23252F),
                          ),
                          borderRadius: BorderRadius.circular(18.px3pt),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE7E7E7),
                          ),
                          borderRadius: BorderRadius.circular(18.px3pt),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xFFFF9A51).withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(18.px3pt),
                        ),
                        hintText: 'Enter tracking number',
                        hintStyle: TextStyle(
                          color: Color(0x23252F).withOpacity(0.5),
                          fontSize: 13.px3pt,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            searchNormalIllustration,
                            width: 20.px3pt,
                            height: 20.px3pt,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(
                            filterIllustration,
                            width: 20.px3pt,
                            height: 20.px3pt,
                            fit: BoxFit.scaleDown,
                          ),
                          onPressed: () {
                            // Clear the text field
                          },
                        ),
                      ),
                    ),
                  )
                ],
              )),
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
                        IconButton(onPressed: (){}, icon: SvgPicture.asset(arrowsIllustration, fit: BoxFit.none, width: 10.px3pt, height: 18.px3pt,), ),
                      ],
                    ),
                  ),
                  Container(
                    // TODO draw the card
                    child: Card(

                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
