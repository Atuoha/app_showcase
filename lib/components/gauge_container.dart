import 'package:flutter/material.dart';


class GaugeContainer extends StatelessWidget {
  const GaugeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.lightBlue,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Text(
          'Your gauge',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
