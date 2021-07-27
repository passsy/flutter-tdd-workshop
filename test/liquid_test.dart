import 'package:flutter/rendering.dart';
import 'package:liquid_simulation/hazardous_liquid.dart';
import 'package:liquid_simulation/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final Finder liquidFinder = find.descendant(of: find.byType(HazardousLiquid), matching: find.byType(Container));

void main() {
  testWidgets('Starts with 19.0°C', (tester) async {
    await tester.pumpWidget(LabApp());
    expect(find.text('19.0°C'), findsOneWidget);
  });

  testWidgets('74.0°C is orange', (tester) async {
    await tester.pumpWidget(LabApp());

    // TODO change input to 74.0°C
    expect(find.byType(TextField), findsOneWidget);
    // see what `find` offers

    // TODO wait 5 seconds
    // see what `tester` offers

    // check if the liquid color is orange
    expect(find.byType(Container), findsOneWidget);
    final container = tester.widget<Container>(find.byType(Container));

    expect(container.color, const Color(0xffffac26));
  });
}
