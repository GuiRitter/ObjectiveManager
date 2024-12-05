import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Column,
        FloatingActionButton,
        Icon,
        Icons,
        MainAxisAlignment,
        Scaffold,
        StatelessWidget,
        Text,
        Theme,
        ValueListenableBuilder,
        Widget;
import 'package:objective_manager/main.dart' show counter;

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
      appBar: AppBar(
        backgroundColor: Theme.of(
          context,
        ).colorScheme.inversePrimary,
        title: Text(
          title,
        ),
      ),
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
