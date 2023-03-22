import 'package:flutter/material.dart';
import 'package:purscliq_app/shared/colors.dart';
import 'package:purscliq_app/shared/textstyles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:purscliq_app/shared/widget/textform.dart';
import 'package:purscliq_app/shared/widget/custom_app_bar.dart';

class Airtime extends StatefulWidget {
  const Airtime({super.key});

  @override
  State<Airtime> createState() => _AirtimeState();
}

TextEditingController phoneNumberController = TextEditingController();
TextEditingController networkProviderController = TextEditingController();
bool? seeAll = true;

class _AirtimeState extends State<Airtime> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "AIRTIME",
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 32, 12, 0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pay from",
                  style: kBlack3TextStyle,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 13),
                  decoration: const BoxDecoration(
                      color: AppColor.blue,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Savings Account ",
                                style: kHeading2TextStyle.copyWith(
                                    color: AppColor.white),
                              ),
                              Text(
                                " 9039938994",
                                style: kBlack3TextStyle.copyWith(
                                    color: AppColor.white),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.wallet,
                                color: AppColor.white,
                                size: 15,
                              ),
                              const SizedBox(width: 5),
                              Text("₦5,000,000.00",
                                  style: kBlue1TextStyle.copyWith(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w900,
                                  ))
                            ],
                          )
                        ],
                      ),
                      DropdownButtonHideUnderline(
                          child: DropdownButton2(
                        customButton: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 24,
                          color: AppColor.white,
                        ),
                        items: const [],
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Favourite Beneficiaries",
                      style: kBlack3TextStyle,
                    ),
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
                const SizedBox(height: 10),
                SizedBox(
                  height: 56,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      FavBenficiary(),
                      FavBenficiary(),
                      FavBenficiary(),
                      FavBenficiary(),
                      FavBenficiary(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Phone Number",
                  style: kBlack3TextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 130,
                        child: TextField(
                            keyboardType: TextInputType.number,
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                                // fillColor: fillColor,
                                // filled: true,

                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.grey.shade300),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.grey.shade300),
                                ),
                                hintText: "Enter phone number",
                                hintStyle: kBlue1TextStyle.copyWith(
                                    color: Colors.grey.shade300))),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                                width: 0, color: Colors.grey.shade300),
                          ),
                          child: const Icon(
                            Icons.person_add_alt_outlined,
                            color: AppColor.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Select Network Provider",
                  style: kBlack3TextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    networkProvider(() {}, "assets/icons/mtn.png"),
                    networkProvider(() {}, "assets/icons/9mobile.png"),
                    networkProvider(() {}, "assets/icons/airtel.png"),
                    networkProvider(() {}, "assets/icons/glo.png"),
                  ],
                ),
                const TextForm(
                  readOnly: false,
                  labelText: "Amount",
                  hintText: "₦ Amount",
                  fillColor: AppColor.white,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.blue,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50)),
                    child: Text(
                      'Continue',
                      style: kBlack2TextStyle.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container networkProvider(VoidCallback onPressed, String image) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.lightgreen,
          minimumSize: Size(90, 90),
          elevation: 1,
        ),
        onPressed: onPressed,
        child: Image.asset(
          image,
          // height: 73,
          // width: 73,
        ),
      ),
    );
  }
}

class FavBenficiary extends StatelessWidget {
  const FavBenficiary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 138,
      height: 56,
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: const BoxDecoration(
        color: AppColor.lightgrey,
        borderRadius: BorderRadius.all(Radius.circular(56)),
      ),
      padding: const EdgeInsets.fromLTRB(0, 12, 8, 12),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            minRadius: 30,
            backgroundColor: AppColor.neutralColor.shade50,
            child: Icon(
              Icons.phone_iphone_rounded,
              size: 25,
              color: AppColor.neutralColor.shade100,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Jide Balogun',
                style: kBlack3TextStyle.copyWith(fontSize: 10),
              ),
              //const SizedBox(height: 8),
              Text(
                '08012345678',
                style: kBlack2TextStyle.copyWith(fontSize: 10),
              ),
            ],
          )
        ],
      ),
    );
  }
}
