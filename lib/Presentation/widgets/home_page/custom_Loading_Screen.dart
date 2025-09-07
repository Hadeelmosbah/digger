import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double percent = 0.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      setState(() {
        percent += 0.02;
        if (percent > 1) {
          percent = 0.0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 15.0,
              percent: percent,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: const Color(0xff2c3550),
              backgroundColor: Colors.grey.shade300,
              center: const Text(
                "Loading...",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE3A325),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Wait Until We Get Your Data\nReady!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                color: Color(0xff2c3550),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
