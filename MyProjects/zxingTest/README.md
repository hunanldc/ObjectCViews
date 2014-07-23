zxing 静态库生成步骤
1.将当前zxingtest下目录cpp目录移动至ZXingWidget目录下，并修改ZXingWidget项目中header search path
2.运行ZXingWidget生成静态库.a文件，使用命令lipo -create .../xxx1.a .../xxx2.a -output .../zxing.a 生成通用静态库(模拟器+真机)
3.将2生成的zxing.a与步骤1中的cpp目录放在同一目录zxing下，并将zxingwidget中的classes目录下的头文件放入zxing目录下
zxing|  ---zxing.a
	 |  ---cpp目录
	 |  ---Classes目录
4.将zxing文件夹复制到目标项目文件夹下，修改header search path，其中Classes目录下的头文件需要循环搜索

问题1：
出现c++中未使用变量报错，修改编译器参数，网上找
问题2:
编译时报c++中未定义的符号，c++编译器版本问题，在Build Settings下，找Apple LLVM 5.1 - language - C++ 
修改C++ standard library 为 libstdc++ (GNU C++ standard library)