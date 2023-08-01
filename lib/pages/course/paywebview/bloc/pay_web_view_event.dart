part of 'pay_web_view_bloc.dart';

/// Implement `PayWebViewEvent` class
@immutable
abstract class PayWebViewEvent {
  const PayWebViewEvent();
}

// This is used to Trigger web view events.
@immutable
class TriggerWebView extends PayWebViewEvent {
  const TriggerWebView(this.url);
  final String url;
}
