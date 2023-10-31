import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

final nameController = TextEditingController();
final subjectController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 40, 25, 0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.account_circle),
                    hintText: 'Name',
                    labelText: 'Name',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: subjectController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.subject_rounded),
                    hintText: 'Subject',
                    labelText: 'Subject',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.message),
                    hintText: 'Message',
                    labelText: 'Message',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {

                    },
                    child: Text(
                      "Enviar",
                      style: TextStyle(fontSize: 20),
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
