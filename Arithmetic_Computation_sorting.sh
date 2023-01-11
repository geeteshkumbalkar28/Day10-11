#!/bin/bash -x

read -p "Enter first number: " a
read -p "Enter second number: " b
read -p "Enter third number: " c


FirstComputation=$(( a + b * c ))
SecondComputation=$(( a * b + c ))
ThirdComputation=$(( c + a / b ))
FourthComputation=$(( a % b + c ))
echo "$a + $b * $c = $FirstComputation"
echo "$a * $b + $c = $SecondComputation"
echo "$c + $a / $b = $ThirdComputation"
echo "$a % $b + $c = $FourthComputation"

declare -A dictionary
declare -a array

dictionary[FirstComputation]=$FirstComputation
dictionary[SecondComputation]=$SecondComputation
dictionary[ThirdComputation]=$ThirdComputation
dictionary[FourthComputation]=$FourthComputation

index=0
for computation in ${!dictionary[@]}
do
    array[index++]=${dictionary[$computation]}
done

echo "The computation results array is"
echo ${array[@]}

size=${#array[@]}

for(( i = 0; i < size - 1; i++ ))
do
    flag=0
    for(( j = 0; j < size - i - 1; j++))
    do
        if((array[j] > array[j+1]))
        then
            temp=${array[j]}
            array[j]=${array[j+1]}
            array[j+1]=$temp
            flag=1
        fi
    done
    if((flag==0))
    then
        break
    fi
done

echo "The Computation results sorted in ascending order are: "
echo ${array[@]}
