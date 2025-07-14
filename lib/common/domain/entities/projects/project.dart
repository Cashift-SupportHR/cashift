import 'package:shiftapp/common/data/models/projects/project.dart';

class Project extends ProjectDto {
  final bool favorite;
  Project(
      {required int id,
      required String projectName,
      required String address,
      required String logo,
      required this.favorite})
      : super(
          id: id,
          projectName: projectName,address: address, logo: logo
        );

  @override
  String toString() {
    return '$projectName';
  }
}
