import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/data_sources/supabase_service.dart';

class DrawerMenuComponent extends StatelessWidget {
  const DrawerMenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    void handleSignOut() async {
      var signOutResult = await supabaseManager.signOutUser();

      signOutResult.fold(
          ifRight: (r) => {GoRouter.of(context).go("/onboarding")},
          ifLeft: (l) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(l.message),
                backgroundColor: const Color.fromARGB(156, 255, 1, 1),
              )));
    }

    return Drawer(
        child: Column(children: [
      const DrawerHeader(child: Text("header")),
      Expanded(
        child: ListView(
            padding: const EdgeInsets.fromLTRB(45, 10, 0, 0),
            children: [
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("VERSION: 1.0.1"),
                        SizedBox(height: 40),
                        Text("Test list item",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        Text("Second test list item",
                            style: TextStyle(
                              fontSize: 20,
                            ))
                      ])),
              InkWell(
                onTap: handleSignOut,
                child: const Text("Log out",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              InkWell(
                  onTap: () {
                    GoRouter.of(context).go("/signup/login-ghost");
                  },
                  child: const Text("Go to Ghost",
                      style: TextStyle(
                        fontSize: 20,
                      )))
            ]),
      )
    ]));
  }
}
