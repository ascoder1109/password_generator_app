// import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'password_generator_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sliderValue = 6;
  String generatedPassword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Password Generator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ), // Add your desired text
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(1, 50, 80, 1),
              Color.fromARGB(255, 0, 16, 26),
              Color.fromRGBO(0, 0, 0, 1)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:
                  TextEditingController(text: "Password Length: $sliderValue"),
              readOnly: true,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
            Slider(
                value: sliderValue.toDouble(),
                min: 6,
                max: 26,
                onChanged: (double newValue) {
                  setState(() {
                    sliderValue = newValue.round();
                  });
                },
                activeColor: Color(0xFF005488) // Set the active color to blue
                ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  generatedPassword = generatePassword(sliderValue);
                });
                print('Generated password: $generatedPassword');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(
                    1, 50, 80, 1), // Set the background color to blue
                foregroundColor: Colors.white, // Set the text color to white
              ),
              child: const Text('Generate Password'),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 4),
                    blurRadius: 5.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(1, 50, 80, 1).withOpacity(0.5),
                      offset: const Offset(0, 4),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextField(
                readOnly: true,
                controller: TextEditingController(text: generatedPassword),
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none // Adjust the radius as needed
                      ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 12.0), // Adjust padding as needed

                  filled: true,
                  fillColor: Color(0xFF002A44),

                  suffixIcon: GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: generatedPassword));

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password copied to clipboard'),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
