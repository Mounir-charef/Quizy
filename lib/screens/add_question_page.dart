import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddQuestionPage extends StatefulWidget {
  const AddQuestionPage({super.key});

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  bool? _isCorrect;

  Future<void> _addQuestion() async {
    if (_formKey.currentState!.validate() && _isCorrect != null) {
      try {
        // Add question to Firestore
        await FirebaseFirestore.instance.collection('questions').add({
          'questionText': _questionController.text,
          'isCorrect': _isCorrect,
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Question added successfully!')),
        );

        // Clear the form
        _questionController.clear();
        setState(() {
          _isCorrect = null;
        });
      } catch (e) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding question: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields!')),
      );
    }
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _questionController,
                decoration: const InputDecoration(
                  labelText: 'Question Text',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Question text is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Text('Is the statement correct?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: _isCorrect,
                    onChanged: (value) {
                      setState(() {
                        _isCorrect = value;
                      });
                    },
                  ),
                  const Text('True'),
                  const SizedBox(width: 20),
                  Radio<bool>(
                    value: false,
                    groupValue: _isCorrect,
                    onChanged: (value) {
                      setState(() {
                        _isCorrect = value;
                      });
                    },
                  ),
                  const Text('False'),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _addQuestion,
                child: const Text('Add Question'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
