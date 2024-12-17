# Class Creator
A way to automate the class creation in CPP.

Little script to automate the class creation in CPP at 42 Lausanne.
It uses the orthodox canonical form.

## How it works
It's quite simple, it use the file in CPP_TEMPLATE and replace the flag {CLASS} in those files by the name of the argument of the script.

The files created are present in the current directory. If there is an inc or src file present then the files will be created there.

That's it.

## How to use

1. Clone the repo.
```
git clone https://github.com/mug4z/CPP-create-class.git
```

2. Change the rights
```
cd CPP-create-class
chmod u+x class_creator.sh
```

3. Run the script with a class name (without <>)
```
./class_creator.sh <Class_name>
```
Author : tfrily 


Copy the cpp tempalte folder in you home.
