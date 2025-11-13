import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shiftapp/data/repositories/local/local_repository.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/profile/view/bloc/profile_ui_state.dart';
import 'package:shiftapp/presentation/presentationUser/profile/view/widgets/profile_item_widget.dart';
import 'package:shiftapp/presentation/presentationUser/profile/view/widgets/request_build_item.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

import '../../../../../main_index.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../adminFeatures/di/injector.dart';
import '../../../../shared/check_face_recognation/page/check_face_recognatin_page.dart';

class ProfileScreen extends BaseStatelessWidget {
  Function(ProfileUiState state) onUpdateState;
  ProfileScreen(
      {Key? key, required ProfileInitialize user, required this.onUpdateState})
      : profileData = user,
        super(key: key);

  final ProfileInitialize profileData;

  @override
  Widget build(BuildContext context) {
    return buildProfileUI(context, profileData: profileData);
  }

  Widget buildProfileUI(BuildContext context,
      {ProfileInitialize? profileData}) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          header(),
          const SizedBox(
            height: 10,
          ),
          sectionTile(strings.profile),
          buildProfileItem(strings.resume, icon: loadSvgIconAsset('profile'),
              onTap: () async {
            final updated = await Navigator.pushNamed(context, Routes.cv);
          }),
          buildProfileItem(strings.add_face_print,
              icon: kLoadSvgInCirclePath(AppIcons.face_recognition_outline,
                  height: 5, width: 5, fit: BoxFit.none), onTap: () async {
            await Navigator.pushNamed(context, Routes.faceRecognitionPage,
                arguments: profileData?.user);
          }),
          buildProfileItem(strings.working_hours,
              icon: loadPngIconAsset('timer', scale: 3.5), onTap: () {
            navigateWorkingHours(context);
          }),
          buildProfileItem(strings.activity_log_title,
              icon: const Icon(
                Icons.history_toggle_off_outlined,
                color: kPrimary,
              ), onTap: () async {
            final updated =
                await Navigator.pushNamed(context, Routes.activitylog);
          }),

          buildProfileItem(strings.favorite_places,
              icon: const Icon(
                Icons.location_on,
                color: kPrimary,
              ), onTap: () async {
            await Navigator.pushNamed(context, Routes.addresses);
          }),
          buildProfileItem(strings.attachments,
              icon: loadPngIconAsset(
                'attachment_emp',
                scale: 1,
              ), onTap: () {
            Navigator.pushNamed(context, Routes.employeeAttachmentPage,
                arguments: profileData?.user.id);
          }),
          SizedBox(
            height: 66,
            width: double.infinity,
            child:    RequestItemBuilder(faceDetectionEnabled: profileData?.accountServices.isAllowFaceRecognition==true,),
          ),

          const SizedBox(
            height: 20,
          ),
          sectionTile(strings.general_settings),
          buildProfileItem(strings.logout,
              icon: loadSvgIconAsset('logout', color: kLipStick),
              onTap: () async {
            onUpdateState(LogoutState());
          }, iconColor: kLipStick.withAlpha(50)),
          buildProfileItem(strings.delete_account,
              icon: const Icon(
                Icons.delete_forever,
                color: kLipStick,
              ), onTap: () async {
            onUpdateState(DeleteAccountState());
          }, iconColor: kLipStick.withAlpha(50)),
        ],
      ),
    );
  }

  Widget loadSvgIconAsset(String iconName, {Color? color}) {
    return SvgPicture.asset('images/$iconName.svg',
        color: color ?? kPrimary, height: 5, width: 5, fit: BoxFit.none);
  }

  Widget loadPngIconAsset(String iconName, {Color? color, double? scale}) {
    return Image.asset(
      'images/$iconName.png',
      color: color ?? kPrimary,
      scale: scale ?? 6,
    );
  }

  Widget loadPngIconAssetPath(String path, {Color? color}) {
    return Image.asset(
      path,
      color: color ?? kPrimary,
      scale: 6.5,
    );
  }

  buildProfileItem(String data,
      {required Widget icon,
      Color? iconColor,
      Function? onTap,
      bool enable = true}) {
    return enable
        ? ProfileItemWidget(
            label: data,
            onTap: onTap,
            icon: icon,
            iconColor: iconColor,
          )
        : Container();
  }

  Widget header() {
    final _user = profileData.user;
    return ListTile(
        leading: ProfileImagePicker(
          onPickImage: (file) {
            onUpdateState(UpdateProfilePictureState(file));
            //   _profileBloc.addopportunityemployee(UpdateProfileImage(file));
          },
          imagePath: _user.getImagePath() ?? '',
        ),
        title: Text(
          _user.name ?? '',
          style: kTextMedium.copyWith(fontSize: 14),
        ),
        subtitle: Text(
          _user.phone ?? '',
          style: kTextRegular.copyWith(fontSize: 12, color: kBattleShipGrey),
        ));
  }

  Widget sectionTile(String title) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 16),
      child: Text(
        title,
        style: kTextRegular.copyWith(fontSize: 14, color: kCoolGrey),
      ),
    );
  }

  void navigateBankAccount(BuildContext context) {
    Navigator.pushNamed(context, Routes.bankAccountPage);
  }

  void navigatePhoneWalletAccount(BuildContext context) {
    Navigator.pushNamed(context, Routes.phoneWalletsPage);
  }

  void navigateAttendance(BuildContext context) {
    Navigator.pushNamed(context, Routes.attendancePage);
  }

  void navigateWorkingHours(BuildContext context) {
    Navigator.pushNamed(context, Routes.appliedOffersPage);
  }
}

class ProfileImagePicker extends StatefulWidget {
  final Function(File) onPickImage;
  final String imagePath;

  const ProfileImagePicker(
      {required this.onPickImage, required this.imagePath});
  @override
  _ProfileImagePickerState createState() {
    return _ProfileImagePickerState();
  }
}

// ignore: must_be_immutable
class _ProfileImagePickerState extends State<ProfileImagePicker> {
  final _picker = ImagePicker();
  XFile? pickedFile;
  File? file;

  pickImage() async {
    pickedFile = await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (pickedFile != null) {
      File compressedFile = File(pickedFile!.path);
      final bytes = compressedFile!.readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      final mb = kb / 1024;
      // if (mb <= 1) {
      //   compressedFile = file!;
      // } else {
      //   compressedFile =
      //       await FlutterNativeImage.compressImage(file!.path, quality: 80);
      // }
      final bytes2 = compressedFile.readAsBytesSync().lengthInBytes;
      final kb2 = bytes2 / 1024;
      final mb2 = kb2 / 1024;
      print('IMAGE SIZE BEFORE ${mb} convert to ${mb2}');
      setState(() {
        file = compressedFile;
        widget.onPickImage(compressedFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('IMAGE PATH ${widget.imagePath}');
    return InkWell(
      child: pickedFile == null
          ? kBuildCircleImage(widget.imagePath, size: 50, showFullImage: false)
          : kBuildCircleImageFromFile(file!, size: 50),
      onTap: () {
        pickImage();
      },
    );
  }
}
