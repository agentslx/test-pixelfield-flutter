import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pixelfield_flutter/features/project/bloc/project_bloc.dart';

import 'app.dart';

class BlocManager extends StatelessWidget {
  final Widget child;

  const BlocManager({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProjectBloc()),
      ],
      child: child,
    );
  }
}
