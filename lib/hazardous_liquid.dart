import 'dart:math' as math;

import 'package:liquid_simulation/temperature_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HazardousLiquid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTemperature = context.watch<TemperatureModel>().temperature;
    final expansion = _calculateExpansion(currentTemperature);
    final Color color = _calculateColor(currentTemperature);

    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 60,
            child: TweenAnimationBuilder<Color?>(
              tween: ColorTween(end: color),
              duration: const Duration(seconds: 5),
              builder: (context, color, child) {
                return TweenAnimationBuilder<double>(
                  duration: const Duration(seconds: 5),
                  tween: Tween(begin: 30, end: 50 + 450 * expansion),
                  curve: Curves.bounceOut,
                  builder: (context, height, child) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                      child: Container(
                        color: color,
                        height: height,
                        width: 84,
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      );
    });
  }

  // some chemistry magic, do not change
  Color _calculateColor(double temperature) {
    if (temperature < 0) {
      return const Color(0xff1f3dff);
    }
    if (temperature < 10) {
      return const Color(0xff1f88ff);
    }
    if (temperature < 18) {
      return const Color(0xff20bbe6);
    }
    if (temperature < 27) {
      return const Color(0xff24ebf2);
    }
    if (temperature < 40) {
      return const Color(0xff1ddb99);
    }
    if (temperature < 51) {
      return const Color(0xff1ec943);
    }
    if (temperature < 59) {
      return const Color(0xff5da82a);
    }
    if (temperature < 74) {
      return const Color(0xffc2c240);
    }
    if (temperature < 85) {
      return const Color(0xffffac26);
    }
    if (temperature >= 85) {
      return const Color(0xffff4400);
    }
    return Colors.white24;
  }

  // some chemistry magic, do not change
  double _calculateExpansion(double temperature) {
    const baseTemperatureExpansionCalculation = 26;

    final range = (500 * temperature * temperature + baseTemperatureExpansionCalculation) /
        (500 * 85 * 85 + baseTemperatureExpansionCalculation);
    return math.max(0, math.min(1, range));
  }
}
