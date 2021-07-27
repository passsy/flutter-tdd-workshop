# Flutter TDD Workshop

In this workshop you'll learn how to write test drive unit tests in Dart and test driven widget tests in Flutter.

Learn TDD step by step in unit tests. Practice it in widget tests.

## App Backstory

Fin, a tech entrepreneur wants to build the next unicorn with a sophisticated chemistry simulation 💸
You have an ominous toxic liquid of which you can determine the color and expansion depending on the temperature, with a mind-blowing animation.

An investor requested a demo of the chemistry simulation.
Unfortunately he has spent way too much time putting the finishing touches on the breathtaking animations.
To get a good offer, Fin wants to add new features. But Fin is scared of breaking existing functionality.
The only way to continue is to write tests first, then add new functionality.

## Part 1: Getting used to TDD with unit tests

The first part of the lecture is all about setting up your test infrastructure.
At the end, you should be able to run unit tests in your IDE.

Let's forget about Flutter and Widget and all the beautiful animations for a moment.
First we want to focus on plain unit tests with Dart.

Open the `test/model_test.dart` and implement the `increment()` and `decrement()` functions.
The temperature should de-/increment in 5 degree steps

Follow TDD practices (red-green-refactor):

- Write the test first, and see if it fails
- Implement the functionality, test should be green
- Refactor! Can we improve the code? If yes, do it and make sure the test is still green after refactoring

For more information checkout

- <https://flutter.dev/docs/cookbook/testing/unit/introduction>

When done, commit your code.
If you work in a team, make sure it runs on your partners machine as well

## Part 2: Write Widget tests

The liquid has some interesting property. When the temperature changes it changes volume and color 🌈

See the following table from a real-world experiment

```md
  | temperature  | color   |
  |--------------|---------|
  | < 0          | #1f3dff |
  | < 10         | #1f88ff |
  | < 18         | #20bbe6 |
  | < 27         | #24ebf2 |
  | < 40         | #1ec943 |
  | < 51         | #1ddb99 |
  | < 59         | #5da82a |
  | < 74         | #c2c240 |
  | < 85         | #ffac26 |
  | \>= 85       | #ff4400 |
```

Write widget tests (multiple) that change the temperature and then verify the color of the liquid.

Start in `test/liquid_test.dart`

First learn how to find Widgets in the widget tree <https://api.flutter.dev/flutter/flutter_test/CommonFinders-class.html>
Try to read the current value of the liquid.

Then [enter text](https://flutter.dev/docs/cookbook/testing/widget/tap-drag#2-enter-text-in-the-text-field) as temperature then [tap](https://flutter.dev/docs/cookbook/testing/widget/tap-drag#3-ensure-tapping-a-button-adds-the-todo) the confirm button.

Caution! The temperature doesn't change instantly, but after 5s. You have to wait via [`pump`](https://api.flutter.dev/flutter/flutter_test/TestWidgetsFlutterBinding/pump.html) or [`pumpAndSettle`](https://api.flutter.dev/flutter/flutter_test/WidgetTester/pumpAndSettle.html).

Write at least 3 new tests

## Part 3: Add new features

Until now, we've only written widget tests for existing functionality.
That's what's happening in the real-world way to often.

It would be better if tests would be written beforehand. One way to achieve this is TDD. It also works for UI!

Add a new feature, write tests first, then add the UI and see if it works.

Add plus and minus buttons that call the `increment()` and `decrement()` functions in the `TemperatureModel`.

```dart
InkWell(
  onTap: () => context.read<TemperatureModel>().increment(),
  child: const Icon(Icons.add),
),
```

Time to refactor. Look what you've already accomplished. Take your time and polish the code you've written.
There's always something to improve!

Commit.

## Bonus

Test the height of the liquid. Find a way to get access to the `RenderObject` of the `Container` via [`tester`](https://api.flutter.dev/flutter/flutter_test/WidgetTester-class.html).

Use your debugger to find the exact type of the `RenderObject`, cast it and read the size.
