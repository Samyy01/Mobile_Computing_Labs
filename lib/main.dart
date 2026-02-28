import 'package:flutter/material.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6A1B9A), // Deep Purple
        fontFamily: 'CustomFont',
      ),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // Logic: State 1 - For handling text in the textInput
  final TextEditingController _inputController = TextEditingController();

  // Logic: State 2 - For handling the list of items
  final List<String> _goalsList = [];

  // Logic: Function for handling button click event
  void _addNewGoal() {
    if (_inputController.text.trim().isNotEmpty) {
      setState(() {
        _goalsList.add(_inputController.text.trim());
        _inputController.clear(); // Reset input after adding
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To-Do List',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: const Color(0xFF8E24AA),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Input Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your goal...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addNewGoal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8E24AA),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'ADD GOAL',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1.5),
          // Scrolling View: The "FlatList" equivalent
          Expanded(
            child: ListView.builder(
              itemCount: _goalsList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8E24AA),
                    borderRadius: BorderRadius.circular(
                      25,
                    ), // Rounded style from your image
                  ),
                  child: Text(
                    _goalsList[index],
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
