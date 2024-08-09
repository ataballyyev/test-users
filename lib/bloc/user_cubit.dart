import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/data/model/user_model.dart';
import 'package:test_app/data/source/db_helper.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final DatabaseHelper databaseHelper;

  UserCubit(this.databaseHelper) : super(UserInitial());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoading());
      final users = await databaseHelper.getUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(const UserError('Failed to fetch users.'));
    }
  }

  Future<void> addUser(UserModel user) async {
    try {
      await databaseHelper.insertUser(user);
      fetchUsers();
    } catch (e) {
      emit(const UserError('Failed to add user.'));
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await databaseHelper.updateUser(user);
      fetchUsers();
    } catch (e) {
      emit(const UserError('Failed to update user.'));
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await databaseHelper.deleteUser(id);
      fetchUsers();
    } catch (e) {
      emit(const UserError('Failed to delete user.'));
    }
  }
}
