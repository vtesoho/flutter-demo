import Flutter
import UIKit
import YPImagePicker
import BSImagePicker

public class SwiftFlutterIostestPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_iostest", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterIostestPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("sdfdsfdsfsfasdf")
    var config = YPImagePickerConfiguration()
    config.library.maxNumberOfItems = 3
    let picker = YPImagePicker(configuration: config)
    // result("iOS " + UIDevice.current.systemVersion)
  }
}
