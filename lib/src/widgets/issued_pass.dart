// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import '../data.dart';

class IssuedPassList extends StatelessWidget {
  final List<IssuedPass> passes;
  final ValueChanged<IssuedPass>? onTap;

  const IssuedPassList({
    required this.passes,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: passes.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            passes[index].title,
          ),
          subtitle: Text(
            passes[index].issueDate.toString(),
          ),
          leading: passes[index].passIcon,
          onTap: onTap != null ? () => onTap!(passes[index]) : null,
        ),
      );
}
