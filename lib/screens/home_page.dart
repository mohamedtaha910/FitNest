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
        preferredSize: const Size.fromHeight(125),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 10),
            child: AppBar(
              toolbarHeight: 125,
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
          currentBody == 'BodyParts' ? BodyPartsPage() : EquipmentsPage(),

          // bottom shadow
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withAlpha(200),
                    Colors.white.withAlpha(140),
                    Colors.white.withAlpha(40),
                    // Colors.red,
                  ],
                  begin: AlignmentGeometry.bottomCenter,
                  end: AlignmentGeometry.topCenter,
                ),
              ),
            ),
          ),
          // top shadow
          Positioned(
            top: 142,
            right: 0,
            left: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withAlpha(180),
                    Colors.white.withAlpha(120),
                    Colors.white.withAlpha(10),
                    // Colors.red,
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            right: 0,
            left: 0,
            child: // buttons
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    padding: EdgeInsets.all(1.2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300.withAlpha(10),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.grey.shade300.withAlpha(200),
                        width: 0.8,
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                              child: Container(
                                width:
                                    (MediaQuery.of(context).size.width * 0.5) -
                                    16,
                                padding: EdgeInsets.symmetric(
                                  // horizontal: MediaQuery.of(context).size.width * 0.12,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: currentBody == 'BodyParts'
                                      ? kSecondaryColor.withAlpha(150)
                                      : Colors.grey.shade300.withAlpha(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.accessibility_new,
                                      color: currentBody == 'BodyParts'
                                          ? Colors.white
                                          : Colors.black54,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      textAlign: TextAlign.center,
                                      'BodyParts',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: currentBody == 'BodyParts'
                                            ? Colors.white
                                            : Colors.black54,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 20),
                              child: Container(
                                width:
                                    (MediaQuery.of(context).size.width * 0.5) -
                                    16,
                                padding: EdgeInsets.symmetric(
                                  // horizontal: MediaQuery.of(context).size.width * 0.12,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: currentBody == 'eq'
                                      ? kSecondaryColor.withAlpha(150)
                                      : Colors.grey.shade300.withAlpha(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.bolt_rounded,
                                      color: currentBody == 'eq'
                                          ? Colors.white
                                          : Colors.black54,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Equipments',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: currentBody == 'eq'
                                            ? Colors.white
                                            : Colors.black54,

                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
