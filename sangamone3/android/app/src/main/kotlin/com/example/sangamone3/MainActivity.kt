package com.example.sangamone3

import android.Manifest
import android.content.pm.PackageManager
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){

    private val channel = "com.example.sangamone3/sms"
    private val GET_SMS_PERMISSION_CODE = 101

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor,channel).setMethodCallHandler { call, result ->
            when(call.method){
                "print"->{
                    requestPermission()
                    result.success("Good Morning Kotlin")
                }
            }
        }
    }

    private fun requestPermission(){
        if(ContextCompat.checkSelfPermission(context,Manifest.permission.SEND_SMS)!=PackageManager.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this,arrayOf(Manifest.permission.SEND_SMS),GET_SMS_PERMISSION_CODE)
        }
        else{
            Toast.makeText(context,"Permission Granted",Toast.LENGTH_SHORT).show()
        }
    }

}
