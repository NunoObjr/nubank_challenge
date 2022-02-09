import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../_exports.dart';
import 'components/_exports.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(
                controller: controller.urlText,
                onPressed: controller.shortUrl,
              ),
              const SizedBox(height: 40),
              const Text(MainPageConstants.listText,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 20),
              Expanded(
                child: controller.obx(
                  (state) => ListView(
                  padding: const EdgeInsets.all(8),
                  children: state!.map((element) => Text(
                    element.links!.short!,key:const Key(MainPageConstants.textUrl))).toList(),
                ),
                onLoading: Shimmer.fromColors(
                  child: const ShimmerWidget(),
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                ),
                onError: (error)=>Text(controller.error!.description!)
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
