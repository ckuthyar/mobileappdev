import sys
import os
import pathlib

list1=[]
for i in sys.argv:
    list1.append(i)

b=os.getcwd()
b=b+"\\"+list1[1]
if os.path.exists(b)!=True:
    os.system(f"flutter create {list1[1]}")
else:
    print("exists")


