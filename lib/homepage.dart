import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  TextStyle kHeading1TextStyle = GoogleFonts.metrophobic(
    //fontFamily: 'Metropolis',
    fontWeight: FontWeight.w800,
    fontSize: 18,
    height: 2,
    color: Color.fromARGB(255, 53, 63, 80),
  );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Container(
            height: height * 0.29,
            width: width,
            color: Colors.grey.shade100,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height * 0.085,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello Ayobami",
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
                SizedBox(
                  height: height * 0.041,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
