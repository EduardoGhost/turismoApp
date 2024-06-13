import '../models/user.dart';
import 'DatabaseHelper.dart';

class UserRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  // Insere um usuário no banco de dados
  Future<void> insertUser(User user) async {
    try {
      await _databaseHelper.insert('users', user.toMap());
      print('Usuário inserido com sucesso');
    } catch (e) {
      print('Erro ao inserir usuário: $e');
    }
  }

  // Obtém todos os usuários do banco de dados
  Future<List<User>> getUsers() async {
    try {
      final List<Map<String, dynamic>> maps = await _databaseHelper.queryAllRows('users');
      return List.generate(maps.length, (i) {
        return User.fromMap(maps[i]);
      });
    } catch (e) {
      print('Erro ao obter usuários: $e');
      return [];
    }
  }

  // Atualiza os dados de um usuário no banco de dados
  Future<void> updateUser(User user) async {
    try {
      await _databaseHelper.update('users', user.toMap(), user.id);
      print('Usuário atualizado com sucesso');
    } catch (e) {
      print('Erro ao atualizar usuário: $e');
    }
  }

  // Remove um usuário do banco de dados pelo ID
  Future<void> deleteUser(String id) async {
    try {
      await _databaseHelper.delete('users', id);
      print('Usuário removido com sucesso');
    } catch (e) {
      print('Erro ao remover usuário: $e');
    }
  }

  // Obtém um usuário pelo email
  Future<User?> getUserByEmail(String email) async {
    try {
      final db = await _databaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'users',
        where: 'email = ?',
        whereArgs: [email],
      );

      if (maps.isNotEmpty) {
        return User.fromMap(maps.first);
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao obter usuário por email: $e');
      return null;
    }
  }
}

