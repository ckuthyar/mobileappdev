package com.example.sangamone3

import android.Manifest
import android.database.Cursor
import android.os.Build
import android.os.Bundle
import android.provider.Telephony
import android.telephony.SmsManager
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.content.PermissionChecker
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){

    private val channel = "com.example.sangamone3/sms"
    private val SEND_SMS_PERMISSION = 100
    private val READ_SMS_PERMISSION = 101

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor,channel).setMethodCallHandler { call, result ->
            when(call.method){
                "smsSend"->{
                    val number = call.argument<String>("Phonenumber")
                    val text = call.argument<String>("Text")
                    if(number!=null && text!=null){
                        sendSMS(number,text)
                    }
                }
                "readSms"->{
                    readSMS()
                    result.success(readSMS())
                }
            }
        }
    }

    private fun requestSmsSend(){
        if(ContextCompat.checkSelfPermission(context,Manifest.permission.SEND_SMS)!=PermissionChecker.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.SEND_SMS,Manifest.permission.READ_SMS),SEND_SMS_PERMISSION)
        }
    }

    private fun requestSmsRead(){
        if(ContextCompat.checkSelfPermission(context,Manifest.permission.READ_SMS)!=PermissionChecker.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.READ_SMS,Manifest.permission.RECEIVE_SMS),READ_SMS_PERMISSION)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.SEND_SMS) != PermissionChecker.PERMISSION_GRANTED) {
            requestSmsSend()
        }
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_SMS) != PermissionChecker.PERMISSION_GRANTED) {
            requestSmsRead()
        }
    }



    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        when(requestCode){
            SEND_SMS_PERMISSION->{
                if(grantResults.isEmpty()){
                    Toast.makeText(context,"Permission not Granted",Toast.LENGTH_SHORT).show()
                }
            }
            READ_SMS_PERMISSION->{
                if(grantResults.isEmpty()){
                    Toast.makeText(context,"Permission not Granted",Toast.LENGTH_SHORT).show()
                }
            }
        }
    }

    private fun sendSMS(phoneNumber:String,text:String){
        val smsManager : SmsManager
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.M){
            smsManager  = getSystemService(SmsManager::class.java)
            smsManager.sendTextMessage(phoneNumber,null,text,null,null)
            println("My Phone version is ${Build.VERSION.SDK_INT}")
        }
        else{
            Toast.makeText(context,"Android Version not support",Toast.LENGTH_SHORT).show()
        }
    }

    private fun readSMS():List<Map<Any,Any>>{
        val list1 = mutableListOf<Map<Any,Any>>()
        val cursor : Cursor? = contentResolver.query(Telephony.Sms.CONTENT_URI,null,null,null,"date DESC")
        cursor?.use {
            while (cursor.moveToNext()){
                val map1 = mutableMapOf<Any,Any>()
                for (i in 0 until it.columnCount){
                    map1[it.getColumnName(i)]=it.getString(i)?:""
                }
                list1.add(map1)
            }
        }
        cursor?.close()

        return list1
    }

}