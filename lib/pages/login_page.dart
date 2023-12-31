import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeBtn = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeBtn = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/login_img.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "User Name",
                            hintText: "Enter User Name"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "UserName can not be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: "Password", hintText: "Enter Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password can not be empty";
                          } else if (value.length < 6) {
                            return "Password length should be at least 6";
                          } else {
                            return null;
                          }
                        },
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Material(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeBtn ? 100 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            // decoration: BoxDecoration(
                            //     color: Colors.deepPurple,
                            //     borderRadius: BorderRadius.circular(8)),
                            child: changeBtn
                                ? const Icon(Icons.done)
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                          ),
                        ),
                      )

                      // ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //     },
                      //     style: TextButton.styleFrom(minimumSize: Size(120, 40)),
                      //     child: Text("Login"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
