# MobileAppDev
Download **Flutter - helper utility** once to local directory
```
git pull https://github.com/ckuthyar/mobileappdev.git
```
## In VS Code terminal, create a Flutter app called app1
```
py flutterCreateApp.py app1
```

## Edit utilhelper.json as required
```
[
    {
        "filename":"main",
        "classname":"mainhomepage",
        "appbar":["appbar(rp=appbar)","text(rp=title,text=hello world)","color(rp=bg_color,c=blue)"],
        "body":["row(rp=body)","container(rp=row)","text(rp=container,text=welcome)"]
    },
    {
        "filename":"screen1",
        "classname":"quiz1",
        "appbar":["appbar(rp=appbar)","text(rp=title,text=hello world)","color(rp=bg_color,c=red)"],
        "body":["row(rp=body)","container(rp=row)","text(rp=container,text=welcome1)"]
    },
    {
        "filename":"screen2",
        "classname":"quiz2",
        "appbar":["appbar(rp=appbar)","text(rp=title,text=hello world)","color(rp=bg_color,c=red)"],
        "body":["row(rp=body)","container(rp=row)","text(rp=container,text=welcome2)"]
    }
]
```
AppBar title is *"hello world"*   
AppBar bgcolor is **blue**   
In Main, 
Body-Row-Container has text *"welcome"*   
In Screen1, 
Body-Row-Container has text *"welcome1"*  
In Screen2, 
Body-Row-Container has text *"welcome2"*  

```
py flutil2.py app1
```
Following files will be created inside *lib* directory   
*main.dart*     
*screen1.dart*     
*screen2.dart*   
*screen3.dart*   
```
cd app1
flutter run
```
First time, the build may take upto 3 minutes.   
Connect Android phone to USB port of your laptop
In Android, go to Settings-About Phone-Software Information-Build number.     Click here 7 times to enable *Developer Options*  
Settings-System-Developer Options-USB debugging to be *enabled*
Allow USB debugging? - *Allow*

 
