import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wellness_app/screens/discover_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
      child: Column(
        children: [
          // SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.shade300.withAlpha(200),
                    width: 0.6,
                  ),
                ),
                child: Image.asset('aseets/icons/icon/logo.png', height: 26),
              ),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello, Champ',
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.6,
                    ),
                  ),
                  const Text(
                    'Here We Go ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.shade300.withAlpha(200),
                    width: 0.6,
                  ),
                ),
                child: Icon(Icons.notifications, color: Colors.grey.shade600),
              ),
            ],
          ),
          SizedBox(height: 32),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => DiscoverPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              // height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.grey.shade300.withAlpha(200),
                  width: 0.4,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('aseets/icons/icon/Search.svg', height: 22),
                  SizedBox(width: 16),
                  Text(
                    'Search Excercise.',
                    style: TextStyle(color: Colors.black38, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
