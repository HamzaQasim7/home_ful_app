import 'package:flutter/material.dart';

class SharedStreamBuilder<T> extends StatelessWidget {
  final Stream<T> stream;
  final T? initialData;
  final Widget? loader;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot) builder;

  const SharedStreamBuilder({super.key, required this.stream, this.initialData, required this.builder, this.loader});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
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
