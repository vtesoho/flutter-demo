import Flutter
import UIKit
import YPImagePicker
import Photos

public class SwiftFluttetioscPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "fluttetiosc", binaryMessenger: registrar.messenger())
    let instance = SwiftFluttetioscPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    var config = YPImagePickerConfiguration()
    config.library.mediaType = .photo
    config.showsPhotoFilters = false
    config.albumName = "ThisIsMyAlbum"
    config.startOnScreen = .library
    config.screens = [.library]
    config.showsCrop = .rectangle(ratio: (2/1))
    config.wordings.libraryTitle = "刷吃"
    config.hidesStatusBar = true
    config.library.maxNumberOfItems = 9
    let picker = YPImagePicker(configuration: config)
    picker.didFinishPicking { [unowned picker] items, cancelled in
        if cancelled {
            print("Picker was canceled")
            picker.dismiss(animated: true, completion: nil)
            return
        }
        _ = items.map { print("🧀aaaaa \($0)") }

    }
    
    present(picker, animated: true, completion: nil)
    result("iOS " + UIDevice.current.systemVersion)
  }
}
