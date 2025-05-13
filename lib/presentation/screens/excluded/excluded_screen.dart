import 'package:deeplinking_and_miselanious/config/plugins/share_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExcludedScreen extends StatelessWidget {
  const ExcludedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Excluded Screen'),
              actions: [
                IconButton(
                  onPressed: () {
                    final deepLinking =
                        'https://poke-deeplinking-poc.up.railway.app/deeplinking/index.html?target=/excluded';
                    print('DEEPLINKING: ${deepLinking}');
                    SharePlugin.shareLink(deepLinking, 'Conoce mejor este pókemon');
                  },
                  icon: const Icon(Icons.share_outlined),
                )
              ],
            ),
            SliverFillRemaining(
              child: Center(
                child: Text(
                  'Excluded Screen',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}