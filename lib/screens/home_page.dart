import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wellness_app/components/custom_app_bar.dart';
import 'package:wellness_app/constant.dart';
import 'package:wellness_app/screens/body_parts_page.dart';
import 'package:wellness_app/screens/discover_page.dart';
import 'package:wellness_app/screens/equipments_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentBody = 'BodyParts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 10),
            child: AppBar(
              toolbarHeight: 140,
              backgroundColor: Colors.transparent,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              title: CustomAppBar(),
            ),
          ),
        ),
      ),

      body: Stack(
        clipBehavior: Clip.none,
        children: [
          currentBody == 'BodyParts'
              ? Expanded(child: BodyPartsPage())
              : Expanded(child: EquipmentsPage()),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withAlpha(200),
                    Colors.white.withAlpha(140),
                    Colors.white.withAlpha(40),
                  ],
                  begin: AlignmentGeometry.bottomCenter,
                  end: AlignmentGeometry.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            right: 0,
            left: 0,
            child: // buttons
            Center(
              child: Container(
                padding: EdgeInsets.all(1.2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.grey.shade300.withAlpha(200),
                    width: 0.4,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentBody = 'BodyParts';
                        });
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width * 0.5) - 16,
                        padding: EdgeInsets.symmetric(
                          // horizontal: MediaQuery.of(context).size.width * 0.12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: currentBody == 'BodyParts'
                              ? kSecondaryColor
                              : Colors.grey.shade300,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          'BodyParts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: currentBody == 'BodyParts'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentBody = 'eq';
                        });
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width * 0.5) - 16,
                        padding: EdgeInsets.symmetric(
                          // horizontal: MediaQuery.of(context).size.width * 0.12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: currentBody == 'eq'
                              ? kSecondaryColor
                              : Colors.grey.shade300,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(Icons.safety_check
                            // ),
                            Text(
                              'Equipments',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: currentBody == 'eq'
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
