import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'pay_web_view_event.dart';
part 'pay_web_view_state.dart';

/// Implement `PayWebViewBloc` class.
class PayWebViewBloc extends Bloc<PayWebViewEvent, PayWebViewState> {
  PayWebViewBloc() : super(const PayWebViewState()) {
    // This will handle TriggerWebView event
    on<TriggerWebView>((event, emit) {
      emit(state.copyWith(url: event.url));
    });
  }
}
