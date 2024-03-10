import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final goRoute = NavigationRouter(context: context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Example Clean Code',
        ),
      ),
      body: CustomSizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => goRoute.goToRickyMory(),
              child: const Text('Go to Ricky Morty'),
            ),
            const CustomSizedBox(
              heitgh: 20,
            ),
            ElevatedButton(
              onPressed: () => goRoute.goToChuckNorris(),
              child: const Text('Go to Cuck Norries'),
            )
          ],
        ),
      ),
    );
  }
}
