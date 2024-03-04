import 'package:flutter/material.dart';

class Dummy extends StatefulWidget {
  const Dummy({super.key});
  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
   TextEditingController _controller = TextEditingController();
  int _result = 0;

  void _calculateResult() {
    String input = _controller.text;
    int result = int.tryParse(input) ?? 0;
    result *= 10;
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiply by 10'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a number',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _calculateResult,
              child: Text('Calculate Result'),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}