import json
import os
import sys

list1=[]

for i in sys.argv:
    list1.append(i)

txt=""

class Helper:

    def __init__(self,**kwargs):
        self.filename=kwargs["filename"].lower()
        self.statelessclass=kwargs["filename"][0].upper()+kwargs["filename"][1:].lower()
        self.statefullclass=kwargs["classname"][0].upper()+kwargs["classname"][1:].lower()

    def package(self):
        global txt
        txt=txt+"import 'package:flutter/material.dart';\n"

    def statelesswidget(self):
        global txt
        txt=txt+f"""
class {self.statelessclass} extends StatelessWidget {{
const {self.statelessclass}({{super.key}});

@override
Widget build(BuildContext context) {{
    return MaterialApp(
    home: {self.statefullclass}(),
    );
}}
}}"""
        
    def statefullwidget(self):
        global txt
        txt+=f"""
class {self.statefullclass} extends StatefulWidget {{
const {self.statefullclass}({{super.key}});

@override
State<{self.statefullclass}> createState() => _{self.statefullclass}State();
}}

class _{self.statefullclass}State extends State<{self.statefullclass}> {{
@override
Widget build(BuildContext context) {{
    return Scaffold(
    appBar: ~appbar~,
    body: ~body~,
    );
}}
}}
"""
    def center(self,**kwargs):
        global txt
        b=f"~{kwargs["rp"]}~"
        txt=txt.replace(b,f"""Center(
            child: ~center~,
        )""")
            
    def container(self,**kwargs):
        global txt
        color=None
        width=None
        Height=None
        if "c" not in  kwargs.keys():
            color="white"
        else:
            color=kwargs["c"]
        b=f"~{kwargs["rp"]}~"
        txt=txt.replace(b,f"""Container(
            color: Colors.{color},
            child: ~container~,
        )
        """)
        

    def column(self,**kwargs):
        global txt
        b=f"~{kwargs["rp"]}~"
        txt=txt.replace(b,"""Column(
            children: [
                ~column~,
            ],
        )""")

            
    def row(self,**kwargs):
        global txt
        b=f"~{kwargs["rp"]}~"
        txt=txt.replace(b,"""Row(
            children: [
                ~row~,
            ],
        )""")

    def appbar(self,**kwargs):
        global txt
        b=f"~{kwargs["rp"]}~"
        txt=txt.replace(b,"""AppBar(
        title: ~title~,
        backgroundColor: ~bg_color~,
        )""")
    

    def text(self,**kwargs):
        global txt
        b=f"~{kwargs["rp"]}~"
        text=kwargs["text"]
        style=None
        txt=txt.replace(b,f"""Text("{text}")""")
    
    def color(self,**kwargs):
        global txt
        b=f"~{kwargs["rp"]}~"
        txt=txt.replace(b,f"""Colors.{kwargs["c"]}""")

def runner(lines):
    args={}
    fun_split=lines.split("(")
    arg_split=fun_split[1].replace(")","").split(",")
    for i in arg_split:
        arg_key_value=i.split("=")
        arg_key=arg_key_value[0]
        arg_value=arg_key_value[1]
        if arg_value.isnumeric():
            arg_value=int(arg_value)
        args[arg_key]=arg_value
    return [fun_split[0],args]


file1 = json.load(open("utilhelper.json"))

def selecter(fun_select,args):
    match fun_select:
        case "container":
            helper1.container(**args)

        case "row":
            helper1.row(**args)

        case "center":
            helper1.center(**args)

        case "appbar":
            helper1.appbar(**args)
        
        case "text":
            helper1.text(**args)
        
        case "color":
            helper1.color(**args)

def changer(kwargs,pos1,replace1,replacwith1,replace2,replacwith2):
    if pos1 in kwargs.keys():
        pos1=kwargs[pos1]
        txt=txt.replace(replace1,replacwith1)
    else:
        txt=txt.replace(replace2,replacwith2)

os.chdir(f"{list1[1]}")
os.chdir("lib")

for i in file1:
    txt=""
    print(i)
    helper1 = Helper(filename=i["filename"], classname=i["classname"])
    helper1.package()
    helper1.statelesswidget()
    helper1.statefullwidget()
    for j in i["appbar"]:
        print(runner(j)[1])
        args=runner(j)[1]
        selecter(runner(j)[0],args)
    
    body = i["body"]
    for j in body:
        print(runner(j)[1])
        args=runner(j)[1]
        selecter(runner(j)[0],args)

    with open(f"{i["filename"]}.dart","w") as file1:
        file1.write(txt)


