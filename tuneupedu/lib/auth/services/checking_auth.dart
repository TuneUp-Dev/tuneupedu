import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuneupedu/auth/signin_screen.dart';
import 'package:tuneupedu/screens/admin/side_nav/admin_main_screen.dart';
import 'package:tuneupedu/screens/user/side_nav/user_main_screen.dart';
import 'package:tuneupedu/widgets/loading_screen.dart';

class CheckingAuth extends StatefulWidget {
  const CheckingAuth({super.key});

  @override
  State<CheckingAuth> createState() => _CheckingAuthState();
}

class _CheckingAuthState extends State<CheckingAuth> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('Users')
                  .where('email', isEqualTo: snapshot.data!.email)
                  .limit(1)
                  .get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
                    Map<String, dynamic> userData = snapshot.data!.docs.first
                        .data() as Map<String, dynamic>;
                    String role = userData['role'];
                    if (role == 'Admin') {
                      debugPrint('-----Sigin Successfully-----');

                      return const AdminMainScreen();
                    }
                    if (role == 'User') {
                      debugPrint('-----Sigin Successfully-----');

                      return const UserMainScreen();
                    } else {
                      return const SignInScreen();
                    }
                  } else {
                    return const SignInScreen();
                  }
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                return const LoadingScreen();
              },
            );
          } else {
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
