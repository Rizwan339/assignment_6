import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegExp emailValidate = RegExp(r'^[a-zA-Z0-9]+@(gmail)+[/.](com)$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (String? value) {
                  if (value == "") {
                    return "Name field cannot be empty";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Please enter your name",
                  label: Text("Name"),
                  border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                validator: (String? value) {
                  if(value!.isEmpty){
                    return "Email field cannot be empty";
                  }else if(emailValidate.hasMatch(value)){
                    return null;
                  }else{
                    return "Invalid Email";
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Please enter your Email",
                  label: Text("Email"),
                  border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                validator: (String? value) {
                  if (value == "") {
                    return "password field cannot be empty";
                  } else if(value!.length < 8){
                    return "Password length must be greater than 8";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Please enter your Password",
                  label: Text("Password"),
                  border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: confirmPasswordController,
                validator: (String? value) {
                  if (value == "") {
                    return "Confirm password field cannot be empty";
                  } else if (value!.contains(passwordController.text)) {
                    return null;
                  } else {
                    return "Please enter confirm Password correctly";
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Please enter your Password again",
                  label: Text("Confirm Password"),
                  border: OutlineInputBorder()),
              ),
               const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                  child: const Text("Sign Up")
                  )
            ],
          ),
        ),
      ),
    );
  }
}