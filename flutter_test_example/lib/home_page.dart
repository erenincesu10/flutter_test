import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  int total = 0;
  String totalString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Example"),
      ),
      body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.15,
                    child: TextField(
                      key: ValueKey("TextField1"),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      controller: _firstNumberController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.add),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.15,
                    child: TextField(
                      key: ValueKey("TextField2"),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      controller: _secondNumberController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "=",
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    total.toString(),
                    style: const TextStyle(fontSize: 30),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_firstNumberController.text.isNotEmpty &&
                        _secondNumberController.text.isNotEmpty) {
                      setState(() {
                        total = int.parse(_firstNumberController.text) +
                            int.parse(_secondNumberController.text);
                        totalString = _firstNumberController.text +
                            _secondNumberController.text;
                      });
                    }
                  },
                  child: const Text("Calculate"))
            ],
          )),
    );
  }
}
