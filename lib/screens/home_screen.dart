import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:design/constants/color_constant.dart';
import 'package:design/models/card_model.dart';
import 'package:design/models/operation_model.dart';
import 'package:design/models/transaction_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Current selected opertaion
  int currentOperation = 0;

  // Handle indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];

    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 8.h),
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                // Custom AppBar
                Container(
                    margin: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () => print("Drawer Tapped"),
                            child:
                                SvgPicture.asset('assets/svg/drawer_icon.svg')),
                        Container(
                            height: 59.h,
                            width: 59.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/user_image.png'))))
                      ],
                    )),
                // Greeding section
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good morning',
                          style: GoogleFonts.inter(
                              fontSize: 18.ssp,
                              fontWeight: FontWeight.w400,
                              color: kBlackColor)),
                      Text('Amanda Alex',
                          style: GoogleFonts.inter(
                              fontSize: 30.ssp,
                              fontWeight: FontWeight.w700,
                              color: kBlackColor))
                    ],
                  ),
                ),

                // Card Section
                Container(
                    height: 199.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 16.w, right: 6.w),
                        itemCount: cards.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.only(right: 10.w),
                              height: 199.h,
                              width: 344.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Color(cards[index].cardBackground)),
                              child: Stack(
                                children: [
                                  Positioned(
                                      child: SvgPicture.asset(
                                          cards[index].cardEleventTop)),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: SvgPicture.asset(
                                        cards[index].cardEleventBottom),
                                  ),
                                  Positioned(
                                    left: 29.w,
                                    top: 48.h,
                                    child: Text('CARD NUMBER',
                                        style: GoogleFonts.inter(
                                            fontSize: 14.ssp,
                                            fontWeight: FontWeight.w400,
                                            color: kWhiteColor)),
                                  ),
                                  Positioned(
                                    left: 29.w,
                                    top: 65.h,
                                    child: Text(cards[index].cardNumber,
                                        style: GoogleFonts.inter(
                                            fontSize: 20.ssp,
                                            fontWeight: FontWeight.w700,
                                            color: kWhiteColor)),
                                  ),
                                  Positioned(
                                    right: 21.w,
                                    top: 35.h,
                                    child: Image.asset(
                                      cards[index].cardType,
                                      width: 27.w,
                                      height: 27.h,
                                    ),
                                  ),
                                  Positioned(
                                    left: 29.w,
                                    bottom: 45.h,
                                    child: Text('CARD HOLDER',
                                        style: GoogleFonts.inter(
                                            fontSize: 14.ssp,
                                            fontWeight: FontWeight.w400,
                                            color: kWhiteColor)),
                                  ),
                                  Positioned(
                                    left: 29.w,
                                    bottom: 21.h,
                                    child: Text(cards[index].user,
                                        style: GoogleFonts.inter(
                                            fontSize: 20.ssp,
                                            fontWeight: FontWeight.w700,
                                            color: kWhiteColor)),
                                  ),
                                  Positioned(
                                    left: 202.w,
                                    bottom: 45.h,
                                    child: Text('EXPIRY DATE',
                                        style: GoogleFonts.inter(
                                            fontSize: 14.ssp,
                                            fontWeight: FontWeight.w400,
                                            color: kWhiteColor)),
                                  ),
                                  Positioned(
                                    left: 202.w,
                                    bottom: 21.h,
                                    child: Text(cards[index].cardExpired,
                                        style: GoogleFonts.inter(
                                            fontSize: 20.ssp,
                                            fontWeight: FontWeight.w700,
                                            color: kWhiteColor)),
                                  ),
                                ],
                              ));
                        })),

                // Operation section
                // Operation indicators
                Padding(
                  padding: EdgeInsets.only(
                      left: 16.w, bottom: 13.h, top: 29.h, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Operations',
                          style: GoogleFonts.inter(
                              fontSize: 18.ssp,
                              fontWeight: FontWeight.w700,
                              color: kBlackColor)),
                      Row(
                        children: map<Widget>(operations, (index, selected) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 9.h,
                            width: 9.w,
                            margin: EdgeInsets.only(right: 6.w),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentOperation == index
                                    ? kBlueColor
                                    : kTwentyBlueColor),
                          );
                        }),
                      )
                    ],
                  ),
                ),

                // Operations
                Container(
                    height: 123.h,
                    child: ListView.builder(
                        itemCount: operations.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 16.w),
                        itemBuilder: (contex, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentOperation = index;
                              });
                            },
                            child: OperationCard(
                                operation: operations[index].name,
                                selectedIcon: operations[index].selectedIcon,
                                unselectedIcon:
                                    operations[index].unselectedIcon,
                                isSelected: currentOperation == index),
                          );
                        })),
                // Transaction history
                Padding(
                  padding: EdgeInsets.only(
                      left: 16.w, bottom: 13.h, top: 29.h, right: 10.w),
                  child: Text('Transaction history',
                      style: GoogleFonts.inter(
                          fontSize: 18.ssp,
                          fontWeight: FontWeight.w700,
                          color: kBlackColor)),
                ),
                ListView.builder(
                    itemCount: transactions.length,
                    padding: EdgeInsets.only(left: 16.w, right: 16.w),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 76,
                          margin: EdgeInsets.only(bottom: 13.h),
                          padding: EdgeInsets.only(
                              left: 24.w, top: 12.h, bottom: 12.h, right: 10.w),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: kTenBlackColor,
                                  blurRadius: 10.r,
                                  spreadRadius: 5.r,
                                  offset: Offset(8.0.w, 8.0.h)),
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Container(
                                    height: 57.h,
                                    width: 57.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              transactions[index].photo)),
                                      shape: BoxShape.circle,
                                    )),
                                SizedBox(
                                  width: 13.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(transactions[index].name,
                                        style: GoogleFonts.inter(
                                            fontSize: 18.ssp,
                                            fontWeight: FontWeight.w700,
                                            color: kBlackColor)),
                                    Text(
                                      transactions[index].date,
                                      style: GoogleFonts.inter(
                                          fontSize: 15.ssp,
                                          fontWeight: FontWeight.w400,
                                          color: kGreyColor),
                                    ),
                                  ],
                                )
                              ]),
                              Row(
                                children: [
                                  Text(transactions[index].amount,
                                      style: GoogleFonts.inter(
                                          fontSize: 15.ssp,
                                          fontWeight: FontWeight.w700,
                                          color: kBlueColor))
                                ],
                              )
                            ],
                          ));
                    })
              ],
            )));
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;

  OperationCard(
      {Key? key,
      required this.operation,
      required this.selectedIcon,
      required this.unselectedIcon,
      required this.isSelected})
      : super(key: key);

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 16.w),
        width: 123.w,
        height: 123.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: kTenBlackColor,
                blurRadius: 10.r,
                spreadRadius: 5.r,
                offset: Offset(8.0.w, 8.0.h)),
          ],
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected ? kBlueColor : kWhiteColor,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(widget.isSelected
                  ? widget.selectedIcon
                  : widget.unselectedIcon),
              SizedBox(
                height: 9.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w),
                child: Text(
                  widget.operation,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 15.ssp,
                      fontWeight: FontWeight.w700,
                      color: widget.isSelected ? kWhiteColor : kBlueColor),
                ),
              )
            ]));
  }
}
