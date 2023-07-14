import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'settings_event.dart';
part 'settings_state.dart';

/// Implemet `SettingsBloc`.
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    // Handle trigger settings event.
    on<TriggerSettings>((event, emit) {
      emit(const SettingsState());
    });
  }
}
