part of 'pay_web_view_bloc.dart';

/// Implement `PayWebViewState` class.
@immutable
class PayWebViewState {
  final String url;

  const PayWebViewState({this.url = ""});

  /// If your classes are `Object` are `immutable` and you want create a new `Object`,
  /// based on that the preferred recommended way to go ahead `withCopy` method.
  ///
  /// When you call `copyWith` method your constructor they should be optional
  /// named paramaters, because we using name to assign value.
  ///
  /// So it's like create new object based on older values. Remember this will
  /// takes the older `Object` first if it exists it takes that one and copy the
  /// properties from this. releted if you want pass 1 value.
  ///
  /// We are going to pass event.url
  PayWebViewState copyWith({String? url}) {
    return PayWebViewState(url: url ?? this.url);
  }
}
