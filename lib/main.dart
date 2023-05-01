import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Top-Up Mas Rusdi',
      home: TopUpScreen(),
    );
  }
}

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TopUpScreenState createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  String _resultMessage = '';
  String _selectedGame = 'Free Fire';
  final List<Map<String, dynamic>> _gameList = [
    {
      'name': 'Free Fire',
      'image': const AssetImage('image/FF.jpg'),
    },
    {
      'name': 'PUBG Mobile',
      'image': const AssetImage('image/papji.jpg'),
    },
    {
      'name': 'Mobile Legends',
      'image': const AssetImage('image/ML.jpg'),
    },
    {
      'name': 'Call of Duty: Mobile',
      'image': const AssetImage('image/cod.jpg'),
    },
  ];

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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              itemCount: _gameList.length,
              itemBuilder: (BuildContext context, int index) {
                final game = _gameList[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedGame = game['name'];
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: game['name'] == _selectedGame
                            ? Colors.green
                            : Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: game['image'],
                            height: 64.0,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            game['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: game['name'] == _selectedGame
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
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
