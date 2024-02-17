import 'package:flutter/material.dart';
import 'package:task_management_app/constants/app_colors.dart';

import '../constants/image_path.dart';

class ErrorModal extends StatelessWidget {
  final Function() onPressed;

  const ErrorModal({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.transparent,
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Image.asset(
                  ImagePath.warning,
                  width: 60,
                  height: 60,
                )),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Text(
                    'Somethimg went wrong',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.eclipse,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Failed to load data, please try again.',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: AppColors.gray,
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.brightRed,
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(
                  horizontal: 40,
                )),
                textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
              ),
              onPressed: onPressed,
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
