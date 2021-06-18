import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iherb_helper/models/abstract.dart';

abstract class AbstractValueEditorController<T> {
  final _changesController = StreamController<void>.broadcast();
  Stream<void> get changes => _changesController.stream;

  final _listeners = <VoidCallback>[];

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void fireChange() {
    _changesController.sink.add(null);

    for (final listener in _listeners) {
      listener();
    }
  }

  void setValue(T value); // Nullable
  T getValue(); // Nullable

  void dispose() {
    _changesController.close();
  }
}

abstract class TextValueEditorController<T> extends AbstractValueEditorController<T> {
  final textEditingController = TextEditingController();

  void dispose() {
    textEditingController.dispose();
  }
}

class WithIdTitleEditorController<I, T extends WithIdTitle<I>> extends TextValueEditorController<T> {
  T _value;

  @override
  void setValue(T value) { // Nullable
    _value = value;
    textEditingController.text = value?.title ?? '';
    super.fireChange();
  }

  @override
  T getValue() => _value;
}
