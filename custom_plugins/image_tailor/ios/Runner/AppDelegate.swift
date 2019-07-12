import UIKit
import Flutter
import YPImagePicker
import Photos

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    // GeneratedPluginRegistrant.register(with: self)
    let controller:FlutterViewController = self.window.rootViewController as! FlutterViewController
    let shareChannel = FlutterMethodChannel.init(name: "channel:Chenli", binaryMessenger: controller)
    shareChannel .setMethodCallHandler { (call, result) in
        if ("ChenliShareFile" == call.method) {
            //这里调用
//            print("这里使用flutter里面传递的参数：%@",call.arguments);
            var config = YPImagePickerConfiguration()
            config.targetImageSize = .cappedTo(size: 1024)
            config.isScrollToChangeModesEnabled = false
            config.onlySquareImagesFromCamera = false
            config.showsPhotoFilters = false
            config.library.maxNumberOfItems = 9
            config.library.mediaType = .photo
            config.showsCrop = .rectangle(ratio: (2/1))
            config.startOnScreen = YPPickerScreen.library
            config.screens = [.library]
            config.library.spacingBetweenItems = 2.0
            config.library.skipSelectionsGallery = true
//            config.library.onlySquare = true
            let picker = YPImagePicker(configuration: config)

            picker.didFinishPicking { [unowned picker] items, cancelled in
                if let photo = items.singlePhoto {
//                    print(photo.fromCamera) // Image source (camera or library)
//                    print(photo.image) // Final image selected by the user
//                    print(photo.originalImage) // original image selected by the user, unfiltered
//                    print(photo.modifiedImage) // Transformed image, can be nil
//                    print(photo.exifMeta) // Print exif meta data of original image.
                }
                if cancelled {
                    print("Picker was canceled")
                    picker.dismiss(animated: true, completion: nil)
                    return
                }
                _ = items.map {
                  print("🧀aaaaa \($0)")

                }

//                picker.dismiss(animated: true, completion: nil)
            }

            // let alert = UIActivityViewController.init(activityItems: [call.arguments ?? " "], applicationActivities: nil)
            controller .present(picker, animated: true, completion: nil)
            //这里iOS传递参数给flutter
//            result("😂😂，flutter七夕还是单身吗？")
        }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
