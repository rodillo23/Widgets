import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_providers.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final darkMode = ref.watch(isDarkModeProvider);
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            }, 
            icon: Icon(
              darkMode ?
                Icons.light_mode_outlined
              : Icons.dark_mode_outlined
            )
          )
        ],
      ),
      body: const _CounterView(),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


class _CounterView extends ConsumerWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final clickCounter = ref.watch(counterProvider);

    final TextStyle textStyle = Theme.of(context).textTheme.titleLarge!;

    return Center(
      child: Text(
        'Valor: $clickCounter',
        style: textStyle,
      ),
    );
  }
}