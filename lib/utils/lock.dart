import 'dart:async';

class Lock {
  Future<void>? _isWorking;
  final Map<int, bool> _initialized = {};

  Future<T> synchronized<T>(Future<T> Function() fn) async {
    if (_isWorking != null) await _isWorking;

    final completer = Completer<void>();
    _isWorking = completer.future;

    final result = await fn.call();

    completer.complete();
    _isWorking = null;
    return result;
  }

  Future<void> syncRunOnce(dynamic Function() fn, {int id = 1}) async {
    await synchronized(() async {
      if (_initialized[id] ?? false) return;

      await fn();
      _initialized[id] = true;
    });
  }
}
