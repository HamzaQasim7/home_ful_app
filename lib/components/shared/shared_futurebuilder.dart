import 'package:flutter/material.dart';

class SharedFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget? loader;
  final T? initialData;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot) builder;

  const SharedFutureBuilder({super.key, required this.future, this.initialData, required this.builder, this.loader});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      initialData: initialData,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loader ?? const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.hasData) {
          return builder(context, snapshot);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
