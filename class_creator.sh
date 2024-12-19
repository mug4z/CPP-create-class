#!/bin/bash


# Author : tfrily
# Github : https://github.com/mug4z

if [ $# -eq 1 ]; then
	echo "Enter a class name"
	exit
fi

template_cpp_path="./CPP-create-class/CPP_TEMPLATE/class_template_cpp"
template_hpp_path="./CPP-create-class/CPP_TEMPLATE/class_template_hpp"
class_name_uppercase=$(echo "$var" | tr '[:lower:]' '[:upper:]')

for var in "$@"
do
	if [ -f "./$var.cpp" ] || [ -f "./src/$var.cpp" ] ; then
		echo "File $var.cpp already exist"
	else
		if [ -d "./src" ];then
			cat $template_cpp_path > ./src/"$var".cpp
			sed -i -e "s/{CLASS}/$var/g" ./src/"$var".cpp
		else
			cat  $template_cpp_path > ./"$var".cpp
			sed -i -e "s/{CLASS}/$var/g" ./"$var".cpp
		fi
	fi

	if [ -f "./$var.hpp" ] || [ -f "./inc/$var.hpp" ] ; then
		echo "File $var.hpp already exist"
	else
		if [ -d "./inc" ];then
			cat $template_hpp_path > ./inc/"$var".hpp
			sed -i -e "s/#ifndef {CLASS}/#ifndef $class_name_uppercase/g" ./inc/"$var".hpp
			sed -i -e "s/#define {CLASS}/#define $class_name_uppercase/g" ./inc/"$var".hpp
			sed -i -e "s/{CLASS}/$var/g" ./inc/"$var".hpp
		else
			cat $template_hpp_path > ./"$var".hpp
			sed -i -e "s/#ifndef {CLASS}/#ifndef $class_name_uppercase/g" ./"$var".hpp
			sed -i -e "s/#define {CLASS}/#define $class_name_uppercase/g" ./"$var".hpp
			sed -i -e "s/{CLASS}/$var/g" ./"$var".hpp
		fi
	fi
done
