import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:purscliq_app/Airtime/airtime.dart';
import 'package:purscliq_app/Homepage/homepage_provider.dart';
import 'package:purscliq_app/send_money.dart';

import '../service.dart';
import '../shared/textstyles.dart';
import '../user_data_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController controller = PageController();
  bool _switchValue = false;
  bool seeAll = false;
  Future<UserDataModel?>? userData;
  double _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    userData = Service().getUserData(context);
    setState(() {});
  }

  String capitalize(String value) {
    var result = value[0].toUpperCase();
    bool cap = true;
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " " && cap == true) {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
        cap = false;
      }
    }
    return result;
  }
  //peteradeojo@outlook.com

  Widget slided(String acc, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text("Account - ", style: kHeading2TextStyle),
            Text(acc,
                //"${sFdata?.wallet?.accNo}" ?? "90324531823",
                style: kHeading2TextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 15),
          child: Divider(
            color: Colors.grey.shade400,
            thickness: 0.5,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _switchValue != true
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.wallet,
                        size: 30,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        amount,
                        style: kHeading1TextStyle,
                      )
                    ],
                  )
                : Material(
                    elevation: 10,
                    child: Container(
                      height: 30,
                      width: 72,
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: const Text("₦****.**"),
                    ),
                  ),
            Row(
              children: [
                Text(
                  _switchValue != true ? "Show" : "Hide",
                  style: kHeading2TextStyle.copyWith(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 95, 115, 140)),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.MEd().format(now);
    String formattedTime = DateFormat.jms().format(now);
    final width = MediaQuery.of(context).size.width;
    var state = Provider.of<HomepageProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<UserDataModel?>(
          future: userData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              if (snapshot.data == null) {
                return const Text("Empty");
              }
            }

            Fdata? sFdata = snapshot.data?.fdata;
            String? firstName = capitalize((snapshot.data?.fdata?.firstName)!);
            state.UserInformation(
                firstName,
                capitalize((sFdata?.lastName)!),
                (sFdata?.email)!.toLowerCase(),
                (sFdata?.phone)!,
                (sFdata?.bankDetails?.bankName),
                (sFdata?.bankDetails?.accountName),
                (sFdata?.bankDetails?.accountNumber));
            log("${snapshot.data}");
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade100,
                    child: Column(
                      children: [
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hello $firstName" ?? "User",
                              style: kHeading1TextStyle,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notification_add,
                                  color: Theme.of(context).primaryColor,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: PageView(
                            allowImplicitScrolling: true,
                            scrollDirection: Axis.horizontal,
                            controller: controller,
                            children: <Widget>[
                              slided(
                                "${sFdata?.wallet?.accNo}" ?? "90324531823",
                                "₦ ${sFdata?.wallet?.amt}" ?? "₦5,000,000.00",
                              ),
                              slided(
                                "Savings",
                                "₦ ${sFdata?.totalSaving}" ?? "0.00",
                              ),
                              slided(
                                "Earnings",
                                "₦ 0.00",
                              ),
                            ],
                            onPageChanged: (index) {
                              setState(() {
                                _pageIndex = index.toDouble();
                              });
                            },
                          ),
                        ),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                        CustDotIndicator(
                          currentPage: _pageIndex,
                          count: 3,
                          custMaiN: MainAxisAlignment.start,
                          //  custCross: CrossAxisAlignment.start,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(""),
                            TextButton(
                              onPressed: () {
                                if (seeAll == true) {
                                  setState(() {
                                    seeAll = false;
                                  });
                                } else {
                                  setState(() {
                                    seeAll = true;
                                  });
                                }
                              },
                              child: Text(
                                seeAll == true ? 'See all' : 'Hide',
                                style: kHeading2TextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        seeAll == true
                            ? Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomMainIcon(
                                          FontAwesomeIcons.arrowRightArrowLeft,
                                          "Send Money",
                                          20, () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SendMoney()),
                                        );
                                      }),
                                      CustomMainIcon(
                                          Icons.phone_iphone_outlined,
                                          "Buy Airtime",
                                          30, () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Airtime()),
                                        );
                                      }),
                                      CustomMainIcon(Icons.receipt_outlined,
                                          "Pay Bills", 30, () {}),
                                      CustomMainIcon(Icons.star_border_rounded,
                                          "Request", 30, () {}),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomMainIcon(
                                            FontAwesomeIcons
                                                .arrowRightArrowLeft,
                                            "Send Money",
                                            20, () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SendMoney()),
                                          );
                                        }),
                                        CustomMainIcon(
                                            Icons.phone_iphone_outlined,
                                            "Buy Airtime",
                                            30, () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Airtime()),
                                          );
                                        }),
                                        CustomMainIcon(Icons.receipt_outlined,
                                            "Pay Bills", 30, () {}),
                                        CustomMainIcon(
                                            Icons.star_border_rounded,
                                            "Request",
                                            30,
                                            () {}),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomMainIcon(Icons.wifi_rounded,
                                            "Buy Data", 25, () {}),
                                        CustomMainIcon(Icons.money,
                                            "Quick Loan", 30, () {}),
                                        CustomMainIcon(
                                            Icons.sports_basketball_outlined,
                                            "Savings",
                                            30,
                                            () {}),
                                        CustomMainIcon(
                                            FontAwesomeIcons.calendarDays,
                                            "Events",
                                            25,
                                            () {}),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 24,
                        ),
                        Divider(
                          color: Colors.grey.shade400,
                          thickness: 0.5,
                        ),
                        Container(
                          height: 125,
                          width: width,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.amber,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage("assets/images/image1.png"))),
                        ),
                        const CustDotIndicator(
                          currentPage: 0,
                          count: 3,
                          custMaiN: MainAxisAlignment.center,
                          // custCross: CrossAxisAlignment.start,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Transaction",
                              style: kHeading1TextStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w800),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See All",
                                style: kHeading2TextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade400,
                          thickness: 0.5,
                        ),
                        SingleChildScrollView(
                            child: Column(
                          children: [
                            CustTransactions(
                              formattedDate: formattedDate,
                              formattedTime: formattedTime,
                              transType: "Funds Transfer",
                              transAmount: "- ₦5,000",
                              transName: "Rowland Tunmishe..",
                              statusStyle: kRedStatusTextStyle,
                            ),
                            CustTransactions(
                                formattedDate: formattedDate,
                                formattedTime: formattedTime,
                                transType: "Airtime USSD",
                                transAmount: "+ \$30.21",
                                transName: "NUWD2392002003",
                                statusStyle: kGreenStatusTextStyle),
                            CustTransactions(
                                formattedDate: formattedDate,
                                formattedTime: formattedTime,
                                transType: "Airtime USSD",
                                transAmount: "+ \$30.21",
                                transName: "NUWD2392002003",
                                statusStyle: kGreenStatusTextStyle),
                          ],
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustTransactions extends StatelessWidget {
  const CustTransactions({
    Key? key,
    required this.formattedDate,
    required this.formattedTime,
    required this.transType,
    required this.transAmount,
    required this.transName,
    required this.statusStyle,
  }) : super(key: key);

  final String formattedDate;
  final String formattedTime;
  final String transType;
  final String transAmount;
  final String transName;
  final TextStyle? statusStyle;
  final int? currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 21.0,
                  child: Icon(
                    Icons.arrow_circle_down_outlined,
                    color: statusStyle!.color,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transType,
                      style: kBodyTextStyle,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      transName,
                      style: kHeading1TextStyle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  transAmount,
                  style: statusStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  "$formattedDate $formattedTime",
                  style: kBodyTextStyle,
                ),
              ],
            )
          ],
        ),
        const Divider(
          thickness: 1,
          color: Color.fromARGB(255, 243, 245, 246),
        ),
        // Row(
        //     children: List.generate(
        //         3,
        //         (index) => Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Container(
        //                   color:
        //                       currentIndex == index ? Colors.green : Colors.red,
        //                   height: 30,
        //                   width: 20),
        //             )).toList())
      ],
    );
  }
}

class CustDotIndicator extends StatelessWidget {
  const CustDotIndicator({
    required this.count,
    required this.custMaiN,
    //  required this.custCross,
    required this.currentPage,
    Key? key,
  }) : super(key: key);
  final int count;
  final double currentPage;
  final MainAxisAlignment custMaiN;
  // final CrossAxisAlignment custCross;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      mainAxisAlignment: custMaiN,
      dotsCount: count,
      position: currentPage,
      decorator: DotsDecorator(
          color: const Color.fromARGB(255, 215, 222, 231),
          activeSize: const Size(21.0, 2.0),
          spacing: const EdgeInsets.fromLTRB(3.0, 10, 3, 10),
          size: const Size(21.0, 2.0),
          activeColor: Theme.of(context).primaryColor,
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0))),
    );
  }
}

class CustomMainIcon extends StatelessWidget {
  const CustomMainIcon(
    this.custIcon,
    this.custText,
    this.custSize,
    this.onPressed, {
    Key? key,
  }) : super(key: key);
  final IconData? custIcon;
  final String? custText;
  final double? custSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 24.0,
            child: IconButton(
              icon: Icon(
                custIcon,
                color: Theme.of(context).primaryColor,
                size: custSize,
              ),
              onPressed: onPressed,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            custText!,
            textAlign: TextAlign.center,
            style: kHeading2TextStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 62, 66, 73),
            ),
          )
        ],
      ),
    );
  }
}
