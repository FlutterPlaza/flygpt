import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension WrapBloc on Widget {
  Widget and<T extends BlocBase>(T bloc) {
    return BlocProvider<T>.value(
      value: bloc,
      child: this,
    );
  }
}
