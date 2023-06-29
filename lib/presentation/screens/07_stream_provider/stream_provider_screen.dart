import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const _StreamView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh_rounded),
        onPressed: () {
          ref.invalidate(usersInChatProvider);
        },
      ),
    );
  }
}

//-----------------------------------------------------------
class _StreamView extends ConsumerWidget {
  const _StreamView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersInChat = ref.watch(usersInChatProvider);

    if (!usersInChat.hasValue) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: usersInChat.value!.length,
      itemBuilder: (BuildContext context, int index) {
        final name = usersInChat.value![index];
        return ListTile(
          title: Text(name),
        );
      },
    );
  }
}
