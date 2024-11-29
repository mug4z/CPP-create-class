#!/bin/bash


# Author : tfrily
# Github : https://github.com/mug4z

if [ $# -ne 1 ]; then
	echo "Enter a class name"
	exit
fi

class_name_uppercase=$(echo $1 | tr a-z A-Z)

if [ -f "./$1.cpp" ] || [ -f "./src/$1.cpp" ] ; then
	echo "File $1.cpp already exist"
else
	if [ -d "./src" ];then
		cat /home/tfrily/scripts/bash/CPP_TEMPLATE/class_template_cpp > ./src/$1.cpp
		sed -i -e "s/{CLASS}/$1/g" ./src/$1.cpp
	else
		cat /home/tfrily/scripts/bash/CPP_TEMPLATE/class_template_cpp > ./$1.cpp
		sed -i -e "s/{CLASS}/$1/g" ./$1.cpp
	fi
fi

if [ -f "./$1.hpp" ] || [ -f "./inc/$1.hpp" ] ; then
	echo "File $1.hpp already exist"
else
	if [ -d "./inc" ];then
		cat /home/tfrily/scripts/bash/CPP_TEMPLATE/class_template_hpp> ./inc/$1.hpp
		sed -i -e "s/#ifndef {CLASS}/#ifndef $class_name_uppercase/g" ./inc/$1.hpp
		sed -i -e "s/#define {CLASS}/#define $class_name_uppercase/g" ./inc/$1.hpp
		sed -i -e "s/{CLASS}/$1/g" ./inc/$1.hpp

	else
		cat /home/tfrily/scripts/bash/CPP_TEMPLATE/class_template_hpp> ./$1.hpp
		sed -i -e "s/#ifndef {CLASS}/#ifndef $class_name_uppercase/g" ./$1.hpp
		sed -i -e "s/#define {CLASS}/#define $class_name_uppercase/g" ./$1.hpp
		sed -i -e "s/{CLASS}/$1/g" ./$1.hpp
	fi
fi




