import 'dart:developer';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:purscliq_app/shared/colors.dart';
import 'package:purscliq_app/shared/textstyles.dart';
import 'package:purscliq_app/shared/widget/textfield.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

bool? newPost;
bool? savedPost;
final TextEditingController searchController = TextEditingController();
final TextEditingController newTransferTypeController = TextEditingController();
final TextEditingController savedTransferTypeController =
    TextEditingController();
final TextEditingController textEditingController = TextEditingController();
String? selectedValue;

String searchParameter = "";
List<String> banks = [
  "Sterling Bank",
  "KeyStone Bank",
  "FCMB",
  "United Bank for Africa",
  "Diamond Bank",
  "JAIZ Bank",
  "Fidelity Bank",
  "Polaris Bank",
  "Citi Bank",
  "Ecobank",
  "Unity Bank",
  "StanbicIBTC Bank",
  "GTBank PLC"
];

class _SendMoneyState extends State<SendMoney> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            bottom: TabBar(
              indicatorPadding: const EdgeInsets.symmetric(vertical: -6),
              tabs: [
                Text(
                  "New",
                  style: kBodyTextStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                Text(
                  "Saved to benefiary",
                  style: kBodyTextStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 14),
                )
              ],
              indicatorColor: AppColor.blue,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: true,
            title: Text(
              "Transfer",
              style: kBlack1TextStyle.copyWith(
                  fontWeight: FontWeight.w800, fontSize: 18),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColor.blue,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: TabBarView(children: [
            // New Beneficiary

            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 60),
                child: Form(
                    child: Column(
                  children: <Widget>[
                    TextForm(
                      controller: newTransferTypeController,
                      maximumLines: 1,
                      fillColor: AppColor.white,
                      labelText: "Select Transfer Type",
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
                                  height: 250,
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      )),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 3,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: AppColor.greyText),
                                      ),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            newPost = false;
                                            newTransferTypeController.text =
                                                "Cliq ID";
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Color.fromARGB(
                                                  255, 243, 244, 246)),
                                          child: Row(
                                            children: const [
                                              Image(
                                                  colorBlendMode:
                                                      BlendMode.clear,
                                                  //color: Color.fromARGB(255, 215, 222, 231),
                                                  height: 28,
                                                  width: 28,
                                                  image: AssetImage(
                                                      "assets/icons/purscliq_logo.png")),
                                              SizedBox(width: 20),
                                              Text("CLIQ ID"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      // Other Banks
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            newPost = true;
                                            newTransferTypeController.text =
                                                "to Other Banks";
                                          }
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Color.fromARGB(
                                                  255, 243, 244, 246)),
                                          child: Row(
                                            children: const [
                                              Image(
                                                  colorBlendMode:
                                                      BlendMode.clear,
                                                  //color: Color.fromARGB(255, 215, 222, 231),
                                                  height: 28,
                                                  width: 28,
                                                  image: AssetImage(
                                                      "assets/icons/other_banks.png")),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text("Other Banks"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                      hintText:
                          newPost == false ? "To Cliq ID" : "To Other Banks",
                    ),
                    Visibility(
                      visible: newPost == false,
                      child: Column(
                        children: [
                          const TextForm(
                            maximumLines: 1,
                            labelText: "Amount",
                            fillColor: AppColor.white,
                            keyboardType: TextInputType.number,
                          ),
                          const TextForm(
                            maximumLines: 1,
                            labelText: "Enter cliq ID",
                            fillColor: AppColor.white,
                          ),
                          const TextForm(
                            maximumLines: 1,
                            labelText: "Account Name",
                            fillColor: AppColor.white,
                          ),
                          const TextForm(
                            labelText: "Narrative or Reason",
                            fillColor: AppColor.white,
                            maximumLines: 3,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.blue,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 50)),
                              child: Text(
                                'Continue',
                                style: kBlack2TextStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ),
                    // Bank
                    Visibility(
                      visible: newPost == true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Bank",
                            style: kBlack3TextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 12),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Select Item',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: banks
                                    .map((bank) => DropdownMenuItem(
                                          value: bank,
                                          child: Text(
                                            bank,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4)),
                                        border: Border.all(
                                            width: 0,
                                            color: Colors.grey.shade300))),
                                dropdownStyleData: const DropdownStyleData(
                                  maxHeight: 200,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                                dropdownSearchData: DropdownSearchData(
                                  searchController: textEditingController,
                                  searchInnerWidgetHeight: 50,
                                  searchInnerWidget: Container(
                                    height: 50,
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      bottom: 4,
                                      right: 8,
                                      left: 8,
                                    ),
                                    child: TextFormField(
                                        maxLines: 1,
                                        controller: textEditingController,
                                        decoration: InputDecoration(
                                            hintText: "Select a bank...",
                                            fillColor: AppColor.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 0,
                                                  color: Colors.grey.shade300),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 0,
                                                  color: Colors.grey.shade300),
                                            ),
                                            hintStyle: kBlue1TextStyle.copyWith(
                                                color: Colors.grey.shade300))),
                                  ),
                                  searchMatchFn: (item, searchValue) {
                                    return (item.value
                                        .toString()
                                        .toLowerCase()
                                        .contains(searchValue.toLowerCase()));
                                  },
                                ),
                                //This to clear the search value when you close the menu
                                onMenuStateChange: (isOpen) {
                                  if (!isOpen) {
                                    textEditingController.clear();
                                  }
                                },
                              ),
                            ),
                          ),
                          const TextForm(
                            maximumLines: 1,
                            labelText: "Amount",
                            fillColor: AppColor.white,
                            keyboardType: TextInputType.number,
                          ),
                          const TextForm(
                            maximumLines: 1,
                            labelText: "Enter Account Number",
                            fillColor: AppColor.white,
                            keyboardType: TextInputType.number,
                          ),
                          const TextForm(
                            labelText: "Account Name",
                            fillColor: AppColor.white,
                            maximumLines: 1,
                          ),
                          const TextForm(
                            labelText: "Narrative or Reason",
                            fillColor: AppColor.white,
                            maximumLines: 3,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.blue,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 50)),
                              child: Text(
                                'Continue',
                                style: kBlack2TextStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
            // Saved Beneficiary

            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 60),
                child: Form(
                    child: Column(
                  children: <Widget>[
                    TextForm(
                      maximumLines: 1,
                      fillColor: AppColor.white,
                      labelText: "Select Transfer Type",
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
                                  height: 250,
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      )),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 3,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: AppColor.greyText),
                                      ),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            savedPost = false;
                                            savedTransferTypeController.text =
                                                "Cliq ID";
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Color.fromARGB(
                                                  255, 243, 244, 246)),
                                          child: Row(
                                            children: const [
                                              Image(
                                                  colorBlendMode:
                                                      BlendMode.clear,
                                                  //color: Color.fromARGB(255, 215, 222, 231),
                                                  height: 28,
                                                  width: 28,
                                                  image: AssetImage(
                                                      "assets/icons/purscliq_logo.png")),
                                              SizedBox(width: 20),
                                              Text("CLIQ ID"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      // Other Banks
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            savedPost = true;
                                            savedTransferTypeController.text =
                                                "Other Banks";
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Color.fromARGB(
                                                  255, 243, 244, 246)),
                                          child: Row(
                                            children: const [
                                              Image(
                                                  colorBlendMode:
                                                      BlendMode.clear,
                                                  //color: Color.fromARGB(255, 215, 222, 231),
                                                  height: 28,
                                                  width: 28,
                                                  image: AssetImage(
                                                      "assets/icons/other_banks.png")),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text("Other Banks"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                      hintText:
                          savedPost == false ? "To Cliq ID" : "To Other Banks",
                    ),
                    Visibility(
                      visible: savedPost == false,
                      child: Column(
                        children: [
                          TextForm(
                            maximumLines: 1,
                            labelText: "Select Beneficiary",
                            fillColor: AppColor.white,
                            suffixWidget: IconButton(
                              icon: const Icon(Icons.arrow_drop_down),
                              onPressed: () {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return NoRecord();
                                    });
                              },
                            ),
                          ),
                          const TextForm(
                            maximumLines: 1,
                            labelText: "Amount",
                            fillColor: AppColor.white,
                            keyboardType: TextInputType.number,
                          ),
                          const TextForm(
                            labelText: "Narrative or Reason",
                            fillColor: AppColor.white,
                            maximumLines: 3,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.blue,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 50)),
                              child: Text(
                                'Continue',
                                style: kBlack2TextStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: savedPost == true,
                      child: Column(
                        children: [
                          TextForm(
                            maximumLines: 1,
                            labelText: "Select Beneficiary",
                            fillColor: AppColor.white,
                            suffixWidget: IconButton(
                              icon: const Icon(Icons.arrow_drop_down),
                              onPressed: () {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return NoRecord();
                                    });
                              },
                            ),
                          ),
                          const TextForm(
                            maximumLines: 1,
                            labelText: "Amount",
                            fillColor: AppColor.white,
                            keyboardType: TextInputType.number,
                          ),
                          const TextForm(
                            labelText: "Narrative or Reason",
                            fillColor: AppColor.white,
                            maximumLines: 3,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.blue,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 50)),
                              child: Text(
                                'Continue',
                                style: kBlack2TextStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Container NoRecord() {
    return Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        height: 250,
        decoration: BoxDecoration(
            color: AppColor.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 3,
                width: 50,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColor.greyText),
              ),
              const SizedBox(height: 10),
              const Icon(
                Icons.note_alt_outlined,
                color: AppColor.blue,
                size: 60,
              ),
              const SizedBox(height: 20),
              const Text("No Record"),
            ],
          ),
        ));
  }
}
