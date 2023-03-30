import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../data/library.dart';
import '../routing.dart';
import '../widgets/issued_pass.dart';

// class AuthorsScreen extends StatelessWidget {
//   final String title = 'Authors';

//   const AuthorsScreen({super.key});

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: AuthorList(
//           authors: libraryInstance.allAuthors,
//           onTap: (author) {
//             RouteStateScope.of(context).go('/author/${author.id}');
//           },
//         ),
//       );
// }

final auth = FirebaseAuth.instance;
final User? user = FirebaseAuth.instance.currentUser;

class HomeScreen extends StatelessWidget {
  final String title = 'Pune Connect';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            Flexible(
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16),
                          child: const Text("Hii Aakash"),
                        ),
                        if (libraryInstance.allIssuedPasses.isNotEmpty)
                          Container(
                            height: 200,
                            child: QrImage(
                              data: user!.uid,
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          ),
                        if (libraryInstance.allIssuedPasses.isEmpty)
                          Column(
                            children: [
                              const Text("No Passes Issued for the day"),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: FilledButton(
                                  onPressed: () {
                                    RouteStateScope.of(context).go('/book');
                                  },
                                  child: const Text("Issue Pass"),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: IssuedPassList(
                passes: libraryInstance.allIssuedPasses,
                onTap: (issuedPass) {
                  print("Hello");
                },
              ),
            ),
          ],
        ));
  }
}
