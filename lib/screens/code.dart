import 'package:basic_code/screens/Cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldCubitPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TextFieldCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('TextField with Cubit'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocBuilder<TextFieldCubit, String>(
                builder: (context, state) {
                  _controller.value = _controller.value.copyWith(text: state);
                  return TextField(
                    obscureText: true,
                    controller: _controller,
                    onChanged: (value) {
                      context.read<TextFieldCubit>().updateText(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter text',
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              BlocBuilder<TextFieldCubit, String>(
                builder: (context, state) {
                  return Text('You entered: $state');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
