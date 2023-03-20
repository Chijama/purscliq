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
                Text(
                  "Phone Number",
                  style: kBlack3TextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 12),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 267,
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
                TextForm(
                    readOnly: true,
                    controller: networkProviderController,
                    //prefixWidget: ,
                    labelText: "Select Network Provider",
                    suffixWidget: IconButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 0),
                                  height: 350,
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      )),
                                  child: Column(children: [
                                    Container(
                                      height: 3,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: AppColor.grey),
                                    ),
                                    ListView(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      children: [
                                        buildItem(logoLinkT[0],
                                            serviceProviderText[0]),
                                        buildItem(logoLinkT[1],
                                            serviceProviderText[1]),
                                        buildItem(logoLinkT[2],
                                            serviceProviderText[2]),
                                        buildItem(logoLinkT[3],
                                            serviceProviderText[3]),
                                      ],
                                    ),
                                  ]),
                                );
                              });
                        })),
                // Text(
                //   "Select Network Provider",
                //   style: kBlack3TextStyle,
                // ),

                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 4, 0, 12),
                //   child: DropdownButtonHideUnderline(
                //       child: DropdownButton2(
                //           dropdownStyleData: const DropdownStyleData(
                //             maxHeight: 200,
                //           ),
                //           menuItemStyleData: const MenuItemStyleData(
                //             height: 40,
                //           ),
                //           buttonStyleData: ButtonStyleData(
                //               width: MediaQuery.of(context).size.width,
                //               height: 50,
                //               padding: EdgeInsets.symmetric(
                //                   horizontal: 10, vertical: 8),
                //               decoration: BoxDecoration(
                //                   color: AppColor.white,
                //                   borderRadius: const BorderRadius.all(
                //                       Radius.circular(4)),
                //                   border: Border.all(
                //                       width: 0, color: Colors.grey.shade300))),
                //           items: []
                //           //serviceProviderItems.Items.map((e) => DropdownMenuItem<serviceProviderItem>(child: serviceProviderItems.buildItem(e),value: e,)),
                //           )),
                // ),
                const TextForm(
                  readOnly: false,
                  labelText: "Amount",
                  hintText: "₦ Amount",
                  fillColor: AppColor.white,
                ),
                const SizedBox(
                  height: 70,
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

  List<String> serviceProviderText = [
    "MTN Airtime VTU",
    "9mobile Airtime VTU",
    "Airtel Airtime VTU",
    "Glo Airtime VTU"
  ];
  List<String> logoLinkT = [
    "assets/icons/mtn.png",
    "assets/icons/9mobile.png",
    "assets/icons/airtel.png",
    "assets/icons/glo.png"
  ];

  Widget buildItem(String logolink, String serviceProvider) => GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 8),
          height: 50,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: AppColor.lightgrey),
          child: Row(
            children: [
              Image(
                  colorBlendMode: BlendMode.clear,
                  height: 28,
                  width: 28,
                  image: AssetImage(logolink)),
              const SizedBox(width: 20),
              Text(serviceProvider),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            networkProviderController.text = serviceProvider;
          });
        },
      );
}
