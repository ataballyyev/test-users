import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/user_cubit.dart';
import 'package:test_app/data/model/user_model.dart';
import 'package:test_app/presentation/widgets/spaces.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    context.read<UserCubit>().fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text('${user.age}, ${user.phone}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.pen,
                          color: theme.primaryColor,
                        ),
                        onPressed: () {
                          nameController.text = user.name;
                          ageController.text = user.age.toString();
                          phoneController.text = user.phone;
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Edit User'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Name'),
                                  ),
                                  TextField(
                                    controller: ageController,
                                    decoration:
                                        const InputDecoration(labelText: 'Age'),
                                    keyboardType: TextInputType.number,
                                  ),
                                  TextField(
                                    controller: phoneController,
                                    decoration: const InputDecoration(
                                        labelText: 'Phone'),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    final updatedUser = UserModel(
                                      id: user.id,
                                      name: nameController.text,
                                      age: int.parse(ageController.text),
                                      phone: phoneController.text,
                                    );
                                    context
                                        .read<UserCubit>()
                                        .updateUser(updatedUser);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Update'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          CupertinoIcons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          context.read<UserCubit>().deleteUser(user.id!);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is UserError) {
            return Center(child: Text(state.message));
          }

          return const Center(
            child: Text(
              'Not Found!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => CupertinoAlertDialog(
              title: const Text('Add User'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spaces().mediumVerticalSpace(),
                  CupertinoTextField(
                    controller: nameController,
                    placeholder: "Name",
                  ),
                  Spaces().smallVerticalSpace(),
                  CupertinoTextField(
                    controller: ageController,
                    placeholder: "Age",
                    keyboardType: TextInputType.number,
                  ),
                  Spaces().smallVerticalSpace(),
                  CupertinoTextField(
                    controller: phoneController,
                    placeholder: "Phone",
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
              actions: [
                CupertinoButton(
                  onPressed: () {
                    final newUser = UserModel(
                      name: nameController.text,
                      age: int.parse(ageController.text),
                      phone: phoneController.text,
                    );
                    context.read<UserCubit>().addUser(newUser);
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
