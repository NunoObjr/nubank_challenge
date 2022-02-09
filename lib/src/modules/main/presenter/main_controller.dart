import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../_exports.dart';

class MainController extends GetxController with StateMixin<List<UrlResponse>> {

  MainController(this.shortUrlUsecase, this.hiveMethods);
  RxList<UrlResponse> resultUrl = RxList<UrlResponse>([]);
  Failure? error;
  IShortUrl shortUrlUsecase;
  IHiveMethods hiveMethods;
  final urlText = TextEditingController();
  @override
  void onInit() {
    change(resultUrl, status: RxStatus.loading());
    loadUrls();
    super.onInit();
  }

  Future<void> loadUrls() async{
    resultUrl.clear();
    change(resultUrl, status: RxStatus.loading());
    final response = await hiveMethods.read();
    response.fold(
      (responseError){
        error = responseError;
        change(resultUrl, status: RxStatus.error());
      }, 
      (success){
        resultUrl.addAll(success);
        change(resultUrl, status: RxStatus.success());
      });
  }

  Future<void> shortUrl() async{
    change(resultUrl, status: RxStatus.loading());
    final response = await shortUrlUsecase(url:urlText.text);
    response.fold(
      (responseError){
        error = responseError;
        change(resultUrl, status: RxStatus.error());
      }, 
      (success) async{
        final pendingList = [].cast<UrlResponse>();
        pendingList.addAll(resultUrl);
        pendingList.add(success);
        final saveHive = await hiveMethods.write(value:pendingList);
        saveHive.fold(
          (responseError){
          error = responseError;
            change(resultUrl, status: RxStatus.error());
          }, 
          (response) {    
            resultUrl.add(success);
            change(resultUrl, status: RxStatus.success());
          });
      });
  }

}