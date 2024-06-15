import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../data/localTuristicoRepository.dart';
import '../models/localTuristico.dart';

class LocalTuristicoProviders with ChangeNotifier {
  final Map<String, LocalTuristico> _items = {};
  final LocalTuristicoRepository _locaisRepository = LocalTuristicoRepository();

  LocalTuristicoProviders() {
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

  Future<void> put(LocalTuristico localTuristico) async {
    if (localTuristico == null) return;

    if (localTuristico.id.isNotEmpty && _items.containsKey(localTuristico.id)) {
      _items.update(localTuristico.id, (_) => LocalTuristico(
        id: localTuristico.id,
        name: localTuristico.name,
        description: localTuristico.description,
        image: localTuristico.image,
        local: localTuristico.local,
        hours: localTuristico.hours,
        contact: localTuristico.contact,
      ));

      await _locaisRepository.updateLocalTuristico(localTuristico);
    } else {
      final id = Random().nextDouble().toString();
      final newLocal = LocalTuristico(
        id: id,
        name: localTuristico.name,
        description: localTuristico.description,
        image: localTuristico.image,
        local: localTuristico.local,
        hours: localTuristico.hours,
        contact: localTuristico.contact,
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