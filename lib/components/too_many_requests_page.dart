import 'package:flutter/material.dart';

class TooManyRequestsPage extends StatelessWidget {
  const TooManyRequestsPage({
    super.key,
    this.title = 'Too many requests , try again later',
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_tethering_error, size: 95, color: Colors.black54),
          Text(
            title,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
