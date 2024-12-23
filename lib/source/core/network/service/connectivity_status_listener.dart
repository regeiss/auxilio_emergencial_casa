import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:async';

///This stream provider class holds stream notifier
final internetCheckerPod =
    StreamNotifierProvider.autoDispose<InternetStatusNotifier, InternetStatus>(
        InternetStatusNotifier.new);

/// This provider used to when to enable internet checker which
/// can be overriden for default value.
final enableInternetCheckerPod = Provider.autoDispose<bool>((ref) {
  return true;
});

/// This provider used to give a instance Internet Connection Checker
final internetConnectionCheckerPod =
    Provider.autoDispose<InternetConnection>((ref) {
  final internetchecker = InternetConnection.createInstance(
    checkInterval: const Duration(seconds: 5),
  );
  return internetchecker;
});

///This stream notifier class handles internet connection status, and changes status if needed
class InternetStatusNotifier extends AutoDisposeStreamNotifier<InternetStatus> {
  @override
  Stream<InternetStatus> build() {
    final enabled = ref.watch(enableInternetCheckerPod);
    if (enabled) {
      final statuschange =
          ref.watch(internetConnectionCheckerPod).onStatusChange;

      return statuschange.distinct();
    }
    return Stream.value(InternetStatus.connected);
  }

  void change({required InternetStatus status}) {
    state = AsyncValue.data(status);
  }
}

// https://github.com/Shreemanarjun/connection_reliability/blob/main/lib/features/monitor_connection/view/monitor_connection_view.dart