package com.example.sangamone3

import android.Manifest
import android.annotation.SuppressLint
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothManager
import android.database.Cursor
import android.location.Location
import android.location.LocationManager
import android.net.wifi.WifiManager
import android.os.BatteryManager
import android.os.Build
import android.os.Bundle
import android.provider.Telephony
import android.telephony.SmsManager
import android.telephony.TelephonyManager
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.annotation.RequiresPermission
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.content.PermissionChecker
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.BufferedReader
import java.io.FileReader
import java.net.HttpURLConnection
import java.net.URL

class MainActivity: FlutterActivity(){

    private val channel = "com.example.sangamone3/sms"
    private val SEND_SMS_PERMISSION = 100
    private val READ_SMS_PERMISSION = 101
    private val BLUTTOOTH_PERMISSION = 102
    private val WIFI_PERMISSION = 103
    private val LOCTION_PERMISSION = 104
    private val READ_PHONE_STATE = 105

    @SuppressLint("MissingPermission")
    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor,channel).setMethodCallHandler{ call, result ->
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
                "scanBlue"->{
                    val devicedatsa = scanBluetooth()
                    result.success(devicedatsa)
                }
                "scanWifi"->{
                    val wifiresult = scanWifi()
                    result.success(wifiresult)
                }
                "location"->{
                    val location = getLocation()
                    result.success(location)
                }
                "getinfo"->{
                    val map1 = getPhoneInfo()
                    result.success(map1)
                }
                "simstate"->{
                    val map2 = getSimDetails()
                    result.success(map2)
                }
                "post"->{
                    CoroutineScope(Dispatchers.IO).launch {
                        val string2 = getPost()
                        withContext(Dispatchers.Main){
                            result.success(string2)
                        }
                    }
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
        requestBluetooth()
        requestWifi()
        requestLocation()
        requestSimState()
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
            BLUTTOOTH_PERMISSION->{
                if (grantResults.isEmpty()){
                    Toast.makeText(context,"Permission not Granted",Toast.LENGTH_SHORT).show()
                }
            }
            WIFI_PERMISSION->{
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

    private fun requestBluetooth(){
        if(ContextCompat.checkSelfPermission(context,Manifest.permission.BLUETOOTH_CONNECT)!=PermissionChecker.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.BLUETOOTH,Manifest.permission.BLUETOOTH_CONNECT),BLUTTOOTH_PERMISSION)
        }
        else{
            Toast.makeText(context,"Bluetooth permission granted",Toast.LENGTH_SHORT).show()
        }
    }

    private fun requestWifi(){
        if(ContextCompat.checkSelfPermission(context,Manifest.permission.NEARBY_WIFI_DEVICES)!=PermissionChecker.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.NEARBY_WIFI_DEVICES,Manifest.permission.ACCESS_FINE_LOCATION,Manifest.permission.ACCESS_WIFI_STATE),WIFI_PERMISSION)
        }
        else{
            Toast.makeText(context,"Wifi permission granted",Toast.LENGTH_SHORT).show()
        }
    }

    private fun requestLocation(){
        if(ContextCompat.checkSelfPermission(context,Manifest.permission.ACCESS_FINE_LOCATION)!=PermissionChecker.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.ACCESS_FINE_LOCATION,Manifest.permission.ACCESS_COARSE_LOCATION),LOCTION_PERMISSION)
        }
    }
    
    private fun requestSimState(){
        if(ContextCompat.checkSelfPermission(context,Manifest.permission.READ_PHONE_STATE)!=PermissionChecker.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.READ_PHONE_STATE,Manifest.permission.READ_PHONE_NUMBERS),READ_PHONE_STATE)
        }
        else{
            Toast.makeText(context,"Permission Granted",Toast.LENGTH_SHORT).show()
        }
    }



    @SuppressLint("MissingPermission")
    private fun scanBluetooth(): MutableList<Any>{
        if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.M){
            val bluetoothManager: BluetoothManager = getSystemService(BluetoothManager::class.java)
            val bluetoothAdapter : BluetoothAdapter = bluetoothManager.adapter
            val devices : MutableSet<BluetoothDevice>? = bluetoothAdapter.bondedDevices
            val scannedDevices = mutableListOf<Any>()
            if(!devices.isNullOrEmpty()){
                for (i in devices){
                    scannedDevices.add("${i.address}, ${i.uuids}")
                }
            }
            return scannedDevices
        }
        else{
            Toast.makeText(context,"Device not be supported",Toast.LENGTH_SHORT).show()
            return emptyList<Any>().toMutableList()
        }
    }

    @SuppressLint("MissingPermission")
    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private fun scanWifi(): Any? {
        val wifiManager = getSystemService(WifiManager::class.java)
        if(wifiManager.isWifiEnabled){
            val result = wifiManager.scanResults
            val wifiresult = result.map { it.BSSID }
            return wifiresult
        }
        else{
         return emptyList<Any>().toMutableList()
        }
    }

    @SuppressLint("MissingPermission")
    @RequiresApi(Build.VERSION_CODES.M)
    private fun getLocation():Map<Any,Any>{
        val locationManager = getSystemService(LocationManager::class.java)
        val locations: Location? = locationManager.getLastKnownLocation(LocationManager.NETWORK_PROVIDER)
        val map1 = mutableMapOf<Any,Any>()
        if (locations != null) {
            map1.put("latitude",locations.latitude)
            map1.put("longitude",locations.longitude)
            map1.put("altitude",locations.altitude)
        }
        return map1
    }

    @RequiresApi(Build.VERSION_CODES.S)
    private fun getPhoneInfo():Map<Any,Any>{
        var map1 : MutableMap<Any,Any> = mutableMapOf()
        map1.put("Build API",Build.VERSION.SDK_INT)
        map1.put("Board",Build.BOARD)
        map1.put("Device",Build.DEVICE)
        map1.put("Hardware",Build.HARDWARE)
        map1.put("Brand",Build.BRAND)
        map1.put("Model",Build.SOC_MODEL)
        map1.put("Manufacturer",Build.MANUFACTURER)
        map1.put("SOC Manufacturer",Build.SOC_MANUFACTURER)
        map1.put("User",Build.HOST)
        map1.put("Battery",batteryLevel())
        return map1
    }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun batteryLevel(): List<Any> {
        val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
        val batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        val list1: MutableList<Any> = mutableListOf()
        list1.add(batteryLevel)
        list1.add(batteryManager.isCharging)
        return list1
    }

    @SuppressLint("NewApi")
    @RequiresPermission(allOf = [Manifest.permission.READ_SMS, Manifest.permission.READ_PHONE_NUMBERS, Manifest.permission.READ_PHONE_STATE])
    @RequiresApi(Build.VERSION_CODES.M)
    private fun getSimDetails(): Map<Any,Any> {
        val telephonyManager = getSystemService(TelephonyManager::class.java)
        val simDet = telephonyManager.simOperator
        val simnumber = telephonyManager.line1Number
        val operator1 = telephonyManager.networkOperator
        val country = telephonyManager.simCountryIso
        val countryNetwork = telephonyManager.networkCountryIso
        val signalStrength = telephonyManager.signalStrength!!.level
        val map1 = mutableMapOf<Any,Any>()
        map1.put("simOperator",simDet)
        map1.put("networkOperator",operator1)
        map1.put("number",simnumber)
        map1.put("countrySim",country)
        map1.put("networkcountry",countryNetwork)
        map1.put("level",signalStrength)
        return map1
    }

    private fun getPost(): String? {
        val url = URL("https://jsonplaceholder.typicode.com/posts").openConnection() as HttpURLConnection
        url.requestMethod="GET"
        val data = url.inputStream.bufferedReader().use {
            it.readText()
        }
        return data
    }
}