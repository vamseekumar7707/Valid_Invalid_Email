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
