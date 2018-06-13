#! /bin/bash
#Variables
content=$(cat index.html)
start_counter=0
end_counter=0
errors=0

#Main
for word in $content
do

	if [[ $word == *"<"*">"* ]]
	then
		continue

	elif [[ $word == "<"* ]]
	then
		start_counter=$((start_counter+1))

	elif [[ $word == *">" ]]
	then
		end_counter=$((end_counter+1))
	fi
done

#Test if all tags are closed
if [ $start_counter -ne $end_counter ]
then
	errors=$((errors+1))
	if [ $start_counter -gt $end_counter ]
	then
		echo
		echo "###############################################################"
		echo "# ERROR: One or more tags have not been successfully closed.  #"
		echo "#          There are $start_counter: '<' and only $end_counter: '>'            #"
		echo "###############################################################"
		echo
	else
		echo
		echo "#############################################################"
		echo "#  ERROR: One or more tags are missing a starting bracket.  #"
                echo "#             There are only $start_counter: '<' and $end_counter: '>'              #"
		echo "#############################################################"
		echo
	fi
else
	echo "All tags have been successfully closed."
fi

#Test if the necessary content (Hello world) is present
if [[ $content != *"Hello world"*  ]]
then
	errors=$((errors+1))
	echo
	echo "############################################"
	echo "#    ERROR: Crucial content is missing!    #"
	echo "# Could not find the phrase 'Hello world'. #"
	echo "############################################"
	echo
else
	echo "Content found."
fi

#Summary
if [ $errors -ne 0 ]
then
	echo "Script finished with $errors errors."
	echo "See specified error messages above."
	exit -1
else
	echo "Script finished with no errors."
fi

