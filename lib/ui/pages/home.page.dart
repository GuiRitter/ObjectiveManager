import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Column,
        FloatingActionButton,
        Icon,
        Icons,
        MainAxisAlignment,
        Radio,
        Scaffold,
        StatelessWidget,
        Switch,
        Text,
        Theme,
        ValueListenableBuilder,
        Widget;
import 'package:objective_manager/main.dart' show counter;
import 'package:objective_manager/ui/widgets/app_bar_custom.widget.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: const AppBarCustomWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (
                context,
                value,
                child,
              ) =>
                  Text(
                '$value',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium,
              ),
            ),
            Switch(
              onChanged: (bool value) {},
              value: false,
            ),
            Switch(
              onChanged: (bool value) {},
              value: true,
            ),
            Radio<String>(
              value: 'alpha',
              groupValue: 'bravo',
              onChanged: (
                String? value,
              ) {},
            ),
            Radio<String>(
              value: 'bravo',
              groupValue: 'bravo',
              onChanged: (
                String? value,
              ) {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment ',
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void _incrementCounter() {
    counter.value++;
  }
}
