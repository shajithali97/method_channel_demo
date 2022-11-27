package com.example.method_channel_demo

import android.os.Build
import android.provider.Settings
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.method_channel_demo/androidDeviceInfo"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
           if(call.method == "getAndroidDeviceInfo"){
               try{
                   var details=getDeviceInfo()
                   Log.i("MAIN",details.toString())
                   result.success(details)
               }catch (e:Exception){
                    result.error("UNAVAILABLE", "Device details not available.", null)
               }
           }
        }
    }

    private fun getDeviceInfo(): HashMap<String, Any> {
        val build: HashMap<String, Any> = HashMap()
        build["model"] = Build.MODEL
        build["device"]=Build.DEVICE
        build["manufacturer"]=Build.MANUFACTURER
        build["board"]=Build.BOARD
        build["brand"]=Build.BRAND

        build["id"]= Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)
    return build
    }
}
