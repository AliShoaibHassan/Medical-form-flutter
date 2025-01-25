import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(section6A());
}

class section6A extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Medical History",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(12),
        ),
      ),
      home: MedicalHistoryForm(),
    );
  }
}

class MedicalHistoryForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MedicalHistoryFormState();
  }
}

class _MedicalHistoryFormState extends State<MedicalHistoryForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical History"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "List any previous surgeries",
                  labelText: "Previous Surgeries",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your previous surgeries or 'None'";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter chronic conditions (if any)",
                  labelText: "Chronic Conditions",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please mention chronic conditions or 'None'";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "List any allergies (if any)",
                  labelText: "Allergies",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please mention allergies or 'None'";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: "Additional comments (if any)",
                  labelText: "Comments",
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Medical History Submitted Successfully!"),
                      ),
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
