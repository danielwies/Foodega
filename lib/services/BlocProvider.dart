import 'package:flutter/material.dart';
import 'package:foodegaapp/services/BlocInterface.dart';

class BlocProvider<T extends BlocInterface> extends StatefulWidget {
  final T bloc;
  final Widget child;

  const BlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocInterface>(BuildContext context) {
    return context.findAncestorWidgetOfExactType<BlocProvider<T>>().bloc;
  }
}

class _BlocProviderState<T extends BlocInterface>
    extends State<BlocProvider<T>> {
  @override
  void dispose() {
    this.widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return this.widget.child;
  }
}
