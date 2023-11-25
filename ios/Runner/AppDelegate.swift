import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL = "com.example.dog_app/os_version"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)

        methodChannel.setMethodCallHandler { (call, result) in
            if call.method == "getOSVersion" {
                result(self.getIOSVersion())
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getIOSVersion() -> String {
        return "iOS " + UIDevice.current.systemVersion
    }
}
