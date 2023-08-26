// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_task_xam/app/core/base/base_view.dart';
import 'package:flutter_task_xam/app/core/utils/image_utils.dart';
import 'package:flutter_task_xam/presentation/controllers/upload_photo.controller.dart';
import 'package:flutter_task_xam/presentation/widgets/add_photo_section.widget.dart';
import 'package:flutter_task_xam/presentation/widgets/comments_section.widget.dart';
import 'package:flutter_task_xam/presentation/widgets/details_section.widget.dart';

class UploadPhotoView extends BaseView<UploadPhotoController> {
  const UploadPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'New Dairy',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            )),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Row(
              children: [
                Image(
                  height: 15,
                  width: 15,
                  image: AssetImage(
                    ImageUtils.getIcons('pin_location'),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  '200412345|TAP-NSTAP-North Strathfield',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Add to site dairy',
                        style: TextStyle(fontSize: 14),
                      ),
                      Image(
                        width: 20,
                        height: 20,
                        image: AssetImage(
                          ImageUtils.getIcons('q_mark'),
                        ),
                      )
                    ],
                  ),
                ),
                const AddPhotoSectionWidget(),
                const CommentSectionWidget(),
                const DetailsSectionWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
