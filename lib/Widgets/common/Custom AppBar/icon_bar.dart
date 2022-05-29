import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Routers/route_names.dart';

class IconBar extends StatelessWidget {
  final IconData leadingIcon;
  const IconBar({Key? key, required this.leadingIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Icon(leadingIcon),
      actions: [
        IconButton(
          onPressed: () async {
            FirebaseAuth auth = FirebaseAuth.instance;
            await auth.signOut();
            Navigator.popAndPushNamed(context, login);
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }
}



