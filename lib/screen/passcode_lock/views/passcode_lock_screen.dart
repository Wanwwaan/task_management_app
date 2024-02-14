import 'package:flutter/material.dart';

class PasscodeLockScreen extends StatefulWidget {
  const PasscodeLockScreen({super.key});

  @override
  State<PasscodeLockScreen> createState() => _PasscodeLockScreenState();
}

class _PasscodeLockScreenState extends State<PasscodeLockScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: const Text('PasscodeLockScreen'),
    );
  }
}