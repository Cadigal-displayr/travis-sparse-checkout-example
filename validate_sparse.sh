# Read all files into an array "https://stackoverflow.com/a/23357277"
files=()
while IFS=  read -r -d $'\0'; do
    files+=("$REPLY")
done < <(find . -print0)


# Search for files that should not exist
for file in "${files[@]}"
do
    if [[ "$file" == "./should-be-excluded/should-be-excluded.txt" ]]
    then
        echo "FAIL: found excluded file '$file'"
        exit 1;
    fi
done
# Search for files that should exist
for file in "${files[@]}"
do
    if [[ "$file" == "./should-be-included/should-be-included.txt" ]]
    then
        echo "SUCCESS: found included file '$file'"
        exit 0;
    fi
done
# If we get to here, we didn't find any files in the loop
echo "FAIL: Could not find any files that should be included"
exit 1;
