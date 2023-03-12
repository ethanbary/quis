import 'package:flutter/material.dart';
import 'package:quis/responsive/responsive.dart';
import 'package:quis/widgets/custom_button.dart';
import 'package:quis/widgets/custom_text.dart';
import 'package:quis/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                fontSize: 70,
                text: 'Join Room',
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter your  nickname...',
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomTextField(
                controller: _gameIdController,
                hintText: 'Enter game ID',
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomButton(onTap: () {}, text: 'Join Room'),
            ],
          ),
        ),
      ),
    );
  }
}
