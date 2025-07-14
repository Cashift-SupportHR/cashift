import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/consumer_builder.dart';

import 'bloc/face_recognition_cubit.dart';
import 'pages/register_face_recognition_screen.dart';

class RegisterFaceRecognitionPage extends BaseStatelessWidget {
   late FaceRecognitionCubit bloc;
  @override
  Widget build(BuildContext context) {
    bloc = inject<FaceRecognitionCubit>();

    return ConsumerBuilder(
        builder: (state) {
          return RegisterFaceRecognitionScreen(
            onImagePicked: (File value) {
              bloc.saveFace(value);
            },
          );
        },
        listener: (state) {
          buildListener(context, state);
        },
        bloc: bloc);
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(publicContext);
  }
}
