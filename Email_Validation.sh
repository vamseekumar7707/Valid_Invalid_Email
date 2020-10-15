#!/bin/bash
regex="^[a-zA-Z0-9]+([.+-_][a-z-A-Z0-9]+)*@[a-zA-Z0-9]+.[a-z]{2,3}([.][a-z]{2})*$"
valid_inputs=(
	"abc@yahoo.com"
	"abc-100@yahoo.com"
 	"abc.100@yahoo.com"
	"abc111@abc.com"
	"abc-100@abc.net"
	"abc.100@abc.com.au"
	"abc@1.com"
	"abc@gmail.com.com"
	"abc+100@gmail.com"
)


invalid_inputs=(
	"abc@.com.my"
	"abc123@gmail.a"
	"abc123@.com"
	"abc123@.com.com"
	".abc@abc.com"
	"abc()*@gmail.com"
	"abc..2002@gmail.com"
	"abc.@gmail.com"
	"abc@abc@gmail.com"
	"abc@gmail.com.1a"
	"abc@gmail.com.aa.au"
)


function check(){
	echo $1 | grep -P -q $regex
	if [ $? -eq 0 ]
	then
		echo "Pass"
	else
		echo "Fail"
	fi
}
echo "----------Valid Email----------"
for i in "${valid_inputs[@]}"
do
	echo "$i"
	check "$i"
done

echo "----------Invalid Email----------"
for i in "${invalid_inputs[@]}"
do
	echo "$i"
	check "$i"
done
