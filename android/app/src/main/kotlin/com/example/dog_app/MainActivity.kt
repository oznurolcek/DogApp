package com.example.dog_app

import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class MainActivity: FlutterActivity() {
        private val CHANNEL = "com.example.dog_app/os_version"

    private fun getAndroidVersion(): String {
        return try {
            "Android " + Build.VERSION.RELEASE
        } catch (e: Exception) {
            "Bilinmiyor"
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler(
            object : MethodCallHandler {
                override fun onMethodCall(call: MethodCall, result: Result) {
                    if (call.method == "getOSVersion") {
                        result.success(getAndroidVersion())
                    } else {
                        result.notImplemented()
                    }
                }
            }
        )
    }
}
