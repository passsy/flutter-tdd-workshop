import 'package:liquid_simulation/hazardous_liquid.dart';
import 'package:liquid_simulation/temperature_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(LabApp());
}

class LabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TemperatureModel(),
      child: MaterialApp(
        home: LabPage(),
      ),
    );
  }
}

class LabPage extends StatefulWidget {
  @override
  _LabPageState createState() => _LabPageState();
}

class _LabPageState extends State<LabPage> {
  late TextEditingController _tempTextController;
  @override
  void initState() {
    super.initState();
    _tempTextController = TextEditingController();
  }

  @override
  void dispose() {
    _tempTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _FixedSizedWindow(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/testing.jpg",
            height: 800,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 140),
            child: HazardousLiquid(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 190.0),
            child: SizedBox(
              width: 250,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Flexible(
                            child: Text('Temp:'),
                          ),
                          Flexible(
                            child: TextField(
                              controller: _tempTextController,
                              decoration: const InputDecoration(suffixText: '°C'),
                              onSubmitted: (value) =>
                                  context.read<TemperatureModel>().temperature = double.parse(value),
                              keyboardType: const TextInputType.numberWithOptions(signed: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp('-*[0-9]*')),
                              ],
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () {
                          context.read<TemperatureModel>().temperature = double.parse(_tempTextController.text);
                        },
                        child: const Text('Confirm'),
                      ),
                      const SizedBox(height: 20),
                      FittedBox(
                        child: Text(
                          '${context.watch<TemperatureModel>().temperature}°C',
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 36,
                            fontFamily: 'VCR_OSD_Mono',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FixedSizedWindow extends StatelessWidget {
  const _FixedSizedWindow({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: IntrinsicWidth(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 360,
                maxWidth: 360,
                maxHeight: 700,
                minHeight: 700,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
