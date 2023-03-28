// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:pune_connect/src/screens/pass_details.dart';
import '../data.dart';

class PassList extends StatelessWidget {
  final List<Pass> passes;
  final ValueChanged<Pass>? onTap;

  const PassList({
    required this.passes,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(
        child: ListView.builder(
                itemCount: passes.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    style: const TextStyle(fontSize: 24.0),
                    passes[index].title,
                  ),
                  leading: passes[index].passIcon,
                  trailing: Text(passes[index].passIndex.toString()),
                  onTap: () =>  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return PassDetailsScreen(
                        pass: passes[index],);
                    },
                  ))
                ),
              ),
      ),
    ],
  );
}