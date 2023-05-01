import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Top-Up Mas Rusdi',
      home: TopUpScreen(),
    );
  }
}

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TopUpScreenState createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  String _resultMessage = '';

  void _processTopUpRequest() {
    // Add logic to process the top-up request here
    // For now, just display a success message
    setState(() {
      _resultMessage = 'Top-up successful!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top-Up Mas Rusdi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter top-up amount',
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Top Up'),
              onPressed: () {
                _processTopUpRequest();
              },
            ),
            const SizedBox(height: 16.0),
            Text(_resultMessage),
          ],
        ),
      ),
    );
  }
}
