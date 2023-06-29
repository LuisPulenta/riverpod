import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
          child: pokemonAsync.when(
              data: (name) => Text(name),
              error: (_, __) => const Text('No se pudo cargar el nombre'),
              loading: () => const CircularProgressIndicator())),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 2,
            child: const Icon(Icons.add),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state + 1);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 1,
            child: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.invalidate(pokemonIdProvider);
            },
          ),
        ],
      ),
    );
  }
}
