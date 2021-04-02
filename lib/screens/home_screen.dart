import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: SafeArea(
      child: Container(
          margin: EdgeInsets.only(top: 8),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              // Custom AppBar
              Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () => print("Drawer Tapped"),
                          child:
                              SvgPicture.asset('assets/svg/drawer_icon.svg')),
                      Container(
                          height: 59,
                          width: 59,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/user_image.png'))))
                    ],
                  )),
              // Greeding section
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good morning',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: kBlackColor)),
                    Text('Amanda Alex',
                        style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor))
                  ],
                ),
              ),

              // Card Section
              Container(
                  height: 199,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 16, right: 6),
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 199,
                            width: 344,
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
                                  left: 29,
                                  top: 48,
                                  child: Text('CARD NUMBER',
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: kWhiteColor)),
                                ),
                                Positioned(
                                  left: 29,
                                  top: 65,
                                  child: Text(cards[index].cardNumber,
                                      style: GoogleFonts.inter(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: kWhiteColor)),
                                ),
                                Positioned(
                                  right: 21,
                                  top: 35,
                                  child: Image.asset(
                                    cards[index].cardType,
                                    width: 27,
                                    height: 27,
                                  ),
                                ),
                                Positioned(
                                  left: 29,
                                  bottom: 45,
                                  child: Text('CARD HOLDER',
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: kWhiteColor)),
                                ),
                                Positioned(
                                  left: 29,
                                  bottom: 21,
                                  child: Text(cards[index].user,
                                      style: GoogleFonts.inter(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: kWhiteColor)),
                                ),
                                Positioned(
                                  left: 202,
                                  bottom: 45,
                                  child: Text('EXPIRY DATE',
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: kWhiteColor)),
                                ),
                                Positioned(
                                  left: 202,
                                  bottom: 21,
                                  child: Text(cards[index].cardExpired,
                                      style: GoogleFonts.inter(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: kWhiteColor)),
                                ),
                              ],
                            ));
                      })),

              // Operation section
              // Operation indicators
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, bottom: 13, top: 29, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Operations',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor)),
                    Row(
                      children: map<Widget>(operations, (index, selected) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 9,
                          width: 9,
                          margin: EdgeInsets.only(right: 6),
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
                  height: 123,
                  child: ListView.builder(
                      itemCount: operations.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 16),
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
                              unselectedIcon: operations[index].unselectedIcon,
                              isSelected: currentOperation == index),
                        );
                      })),
              // Transaction history
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, bottom: 13, top: 29, right: 10),
                child: Text('Transaction history',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kBlackColor)),
              ),
              ListView.builder(
                  itemCount: transactions.length,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 76,
                        margin: EdgeInsets.only(bottom: 13),
                        padding: EdgeInsets.only(
                            left: 24, top: 12, bottom: 12, right: 10),
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: kTenBlackColor,
                                blurRadius: 10,
                                spreadRadius: 5,
                                offset: Offset(8.0, 8.0)),
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                  height: 57,
                                  width: 57,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            transactions[index].photo)),
                                    shape: BoxShape.circle,
                                  )),
                              SizedBox(
                                width: 13,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(transactions[index].name,
                                      style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: kBlackColor)),
                                  Text(
                                    transactions[index].date,
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
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
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: kBlueColor))
                              ],
                            )
                          ],
                        ));
                  })
            ],
          )),
    ));
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
        margin: EdgeInsets.only(right: 16),
        width: 123,
        height: 123,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: kTenBlackColor,
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(8.0, 8.0)),
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
                height: 9,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: Text(
                  widget.operation,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: widget.isSelected ? kWhiteColor : kBlueColor),
                ),
              )
            ]));
  }
}
