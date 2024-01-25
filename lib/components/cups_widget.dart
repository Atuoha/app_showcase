import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CupsWidget extends StatelessWidget {
  const CupsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        8,
        (index) => Image.asset(
          'assets/imgs/cup.png',
          width: 50,
          color: index % 2 == 0
              ? AppColor.primaryColor
              : Colors.grey.withOpacity(0.6),
        ),
      ),
    );
  }
}
