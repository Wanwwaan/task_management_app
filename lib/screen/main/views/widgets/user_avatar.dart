import 'package:flutter/material.dart';

import '../../../../constants/image_path.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Image.asset(
        ImagePath.user,
        width: 50,
        height: 50,
      ),
    );
  }
}
