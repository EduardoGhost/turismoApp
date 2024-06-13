import '../models/localTuristico.dart';
import 'LocalTuristicoDatabaseHelper.dart';

class LocalTuristicoRepository {
  final LocalTuristicoDatabaseHelper _databaseHelper = LocalTuristicoDatabaseHelper();

  // Insere um local turístico no banco de dados
  Future<void> insertLocalTuristico(LocalTuristico local) async {
    try {
      await _databaseHelper.insert('locais_turisticos', local.toMap());
      print('Local turístico inserido com sucesso');
    } catch (e) {
      print('Erro ao inserir local turístico: $e');
    }
  }

  // Obtém todos os locais turísticos do banco de dados
  Future<List<LocalTuristico>> getLocais() async {
    try {
      final List<Map<String, dynamic>> maps = await _databaseHelper.queryAllRows('locais_turisticos');
      print('Dados carregados: $maps');
      return List.generate(maps.length, (i) {
        return LocalTuristico.fromMap(maps[i]);
      });
    } catch (e) {
      print('Erro ao obter locais turísticos: $e');
      return [];
    }
  }

  // Atualiza os dados de um local turístico no banco de dados
  Future<void> updateLocalTuristico(LocalTuristico local) async {
    try {
      await _databaseHelper.update('locais_turisticos', local.toMap(), local.id);
      print('Local turístico atualizado com sucesso');
    } catch (e) {
      print('Erro ao atualizar local turístico: $e');
    }
  }

  // Remove um local turístico do banco de dados pelo ID
  Future<void> deleteLocalTuristico(String id) async {
    try {
      await _databaseHelper.delete('locais_turisticos', id);
      print('Local turístico removido com sucesso');
    } catch (e) {
      print('Erro ao remover local turístico: $e');
    }
  }

  // Obtém um local turístico pelo nome
  Future<LocalTuristico?> getLocalTuristicoByName(String name) async {
    try {
      final db = await _databaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'locais_turisticos',
        where: 'name = ?',
        whereArgs: [name],
      );

      if (maps.isNotEmpty) {
        return LocalTuristico.fromMap(maps.first);
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao obter local turístico por nome: $e');
      return null;
    }
  }
}