package com.example.sangamone3

import android.Manifest
import android.os.Build
import android.os.Bundle
import android.telephony.SmsManager
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.content.PermissionChecker.PERMISSION_GRANTED
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity(){

    private val channel = "com.example.sangamone3/sms"
    private val GET_PERMISSION_CODE = 101

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor,channel).setMethodCallHandler { call, result ->
            when(call.method){
                "sms" -> {
                    val phoneNumber:String=""
                    val text:String=""
                    sendSms(phoneNumber,text)
                    result.success("Message Sent")
                }
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        requestSmsPermission()
    }

    private fun requestSmsPermission(){
        if(ContextCompat.checkSelfPermission(context,Manifest.permission.SEND_SMS)== PERMISSION_GRANTED){
            Toast.makeText(context,"Permission already Granted",Toast.LENGTH_SHORT).show()
        }
        else{
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.SEND_SMS),GET_PERMISSION_CODE)
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if(grantResults.isEmpty() && grantResults[0]== PERMISSION_GRANTED){
            Toast.makeText(context,"Permission Granted",Toast.LENGTH_SHORT).show()
        }
        else{
            Toast.makeText(context,"Permission Not Granted",Toast.LENGTH_SHORT).show()
        }
    }

    private fun sendSms(phoneNumber: String,text:String){
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val smsManager: SmsManager = getSystemService(SmsManager::class.java) as SmsManager
            smsManager.sendTextMessage(phoneNumber,null,text,null,null)
        } else {
            Toast.makeText(context,"Android version Not satisfied",Toast.LENGTH_SHORT).show()
        }

    }

}

