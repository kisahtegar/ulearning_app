part of 'settings_bloc.dart';

/// Implement `SettingsEvent`.
@immutable
abstract class SettingsEvent {}

/// This event is used to trigger.
@immutable
class TriggerSettings extends SettingsEvent {}
