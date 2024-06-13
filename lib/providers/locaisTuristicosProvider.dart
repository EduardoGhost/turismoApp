import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../data/localTuristicoRepository.dart';
import '../models/localTuristico.dart';


class LocalTuristicoProviders with ChangeNotifier {
  final Map<String, LocalTuristico> _items = {};
  final LocalTuristicoRepository _locaisRepository = LocalTuristicoRepository();

  LocaisTuristicos() {
    _loadLocais();
  }

  List<LocalTuristico> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  LocalTuristico byIndex(int i) {
    return _items.values.elementAt(i);
  }

  Future<void> _loadLocais() async {
    final locais = await _locaisRepository.getLocais();
    _items.clear();
    for (var local in locais) {
      _items[local.id] = local;
    }
    notifyListeners();
  }

  Future<void> put(LocalTuristico local) async {
    if (local == null) return;

    if (local.id.isNotEmpty && _items.containsKey(local.id)) {
      _items.update(local.id, (_) => LocalTuristico(
        id: local.id,
        name: local.name,
        description: local.description,
        image: local.image,
        local: local.local,
      ));

      await _locaisRepository.updateLocalTuristico(local);
    } else {
      final id = Random().nextDouble().toString();
      final newLocal = LocalTuristico(
        id: id,
        name: local.name,
        description: local.description,
        image: local.image,
        local: local.local,
      );
      _items[id] = newLocal;
      await _locaisRepository.insertLocalTuristico(newLocal);
    }
    notifyListeners();
  }

  Future<void> remove(LocalTuristico localTuristico) async {
    if (localTuristico != null && localTuristico.id.isNotEmpty) {
      _items.remove(localTuristico.id);
      await _locaisRepository.deleteLocalTuristico(localTuristico.id);
      notifyListeners();
    }
  }
}