import '../models/localTuristico.dart';
import 'LocalTuristicoDatabaseHelper.dart';

class LocalTuristicoRepository {
  final LocalTuristicoDatabaseHelper _databaseHelper = LocalTuristicoDatabaseHelper();

  // Add local turístico
  Future<void> insertLocalTuristico(LocalTuristico local) async {
    await _databaseHelper.insert('local_turistico', local.toMap());
  }

  // Get all locais turísticos
  Future<List<LocalTuristico>> getLocais() async {
    final List<Map<String, dynamic>> maps = await _databaseHelper.queryAllRows('local_turistico');
    return List.generate(maps.length, (i) {
      return LocalTuristico.fromMap(maps[i]);
    });
  }

  // Update local turístico
  Future<void> updateLocalTuristico(LocalTuristico local) async {
    await _databaseHelper.update('local_turistico', local.toMap(), local.id);
  }

  // Delete local turístico
  Future<void> deleteLocalTuristico(String id) async {
    await _databaseHelper.delete('local_turistico', id);
  }

  // Get local turístico by name
  Future<LocalTuristico?> getLocalTuristicoByName(String name) async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'local_turistico',
      where: 'name = ?',
      whereArgs: [name],
    );

    if (maps.isNotEmpty) {
      return LocalTuristico.fromMap(maps.first);
    } else {
      return null;
    }
  }
}
