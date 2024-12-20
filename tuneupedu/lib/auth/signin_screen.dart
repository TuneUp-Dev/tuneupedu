import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuneupedu/auth/forgot_password_screen.dart';
import 'package:tuneupedu/auth/services/checking_auth.dart';
import 'package:tuneupedu/theme/app_color.dart';
import 'package:tuneupedu/theme/app_text_theme.dart';
import 'package:tuneupedu/widgets/loading_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //loading widgets
  bool loading = false;
  bool eyedata = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool checkvalue = false;
  bool obscureText = true;
  bool buttonValue = true;
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Company');
    QuerySnapshot querySnapshot = await usersCollection.get();
    setState(
      () {
        data = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      },
    );
  }

  Future signin(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
            .whenComplete(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckingAuth(),
            ),
          );
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == e.code) {
          setState(() {
            loading = false;
          });
          wronguser(
              'User not located. Please verify the details and try again');
        } else if (e.code == e.code) {
          setState(() {
            loading = false;
          });
          wronguser('Access denied. The password you provided is incorrect');
        } else {
          setState(() {
            loading = false;
          });
          wronguser('Email or Password invaild');
        }
      }
    } else {
      const Center(child: CircularProgressIndicator());
    }
  }

  void wronguser(String message) {
    final snakcredential = SnackBar(
        content: Text(message),
        elevation: 10,
        duration: const Duration(milliseconds: 250),
        action: SnackBarAction(label: 'Close', onPressed: () {}));

    ScaffoldMessenger.of(context).showSnackBar(snakcredential);
  }

  @override
  Widget build(BuildContext context) {
    var eyeIcon = eyedata == true ? Icons.visibility : Icons.visibility_off;
    double totalWidth = MediaQuery.of(context).size.width;
    return loading
        ? const LoadingScreen()
        : Scaffold(
            body: Align(
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40, left: 40),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  children: [
                                    (data[index]['logo'] != null &&
                                            data[index]['logo'] != '')
                                        ? CircleAvatar(
                                            radius: 50,
                                            backgroundImage: NetworkImage(
                                              data[index]['logo'],
                                            ),
                                          )
                                        : const Text('No Logo'),
                                    Text(
                                      (data[index]['company_name'] != null)
                                          ? data[index]['company_name']
                                          : const Text('Company Name'),
                                      style: CustomTextStyle.titleLarge(context)
                                          .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Log in to your Account',
                                    style: CustomTextStyle.titleLarge(context)
                                        .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('Welcome back!',
                                    style: CustomTextStyle.titleLarge(context)
                                        .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Email',
                                      style: CustomTextStyle.labelLarge(context)
                                          .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                        hintText: 'Email',
                                        prefixIcon: Icon(
                                          Icons.mail,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Email cannot be empty";
                                        }
                                        if (!RegExp(
                                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                            .hasMatch(value)) {
                                          return ("Please enter a valid email");
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Password',
                                      style: CustomTextStyle.labelLarge(context)
                                          .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: passwordController,
                                      obscureText: obscureText,
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        prefixIcon: const Icon(Icons.lock),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              obscureText = !obscureText;
                                              eyedata = !eyedata;
                                            });
                                          },
                                          icon: Icon(
                                            eyeIcon,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        RegExp regex = RegExp(r'^.{6,}$');
                                        if (value!.isEmpty) {
                                          return "Password cannot be empty";
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("please enter valid password min. 6 characters");
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => const ForgotPasswordScreen(),
                                          transition: Transition.cupertino,
                                        );
                                      },
                                      child: const Text(
                                        'Forgot Password?',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                              AppColors.primary),
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      signin(emailController.text,
                                          passwordController.text);
                                    },
                                    child: Text(
                                      'Sign in',
                                      style: CustomTextStyle.labelLarge(context)
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (totalWidth > 700)
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Image.network(
                              'https://cdn.dribbble.com/userupload/3535615/file/original-59fcbbf5ccce5f1c37ba5ea98ed3c922.jpg?resize=1200x900&vertical=center',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          );
  }
}
