#!/bin/bash

# get domain name from user input
echo "Enter website URL:"
read website

# create a directory with the domain name of the website
dir_name=$(echo $website | awk -F/ '{print $3}')
path="./$dir_name"
dir_path="$path"

# create the directory if it doesn't exist
if [ ! -d $dir_path ]; then
  mkdir $dir_path
fi

# Fetching URLs for website and filtering by specific extensions please wait...
echo "Fetching URLs for $website and filtering by specific extensions..."
waybackurls $website | grep -E "(\.js|\.css|\.php|\.asp|\.aspx|\.jsp|\.json|\.html|\.xml)$" | tee $dir_path/filtered_urls.txt

# Checking filtered URLs with httpx and saving the output in httpx_output.txt...
echo "Checking filtered URLs with httpx and saving the output in httpx_output.txt..."
cat $dir_path/filtered_urls.txt | httpx -silent | tee $dir_path/httpx_output.txt

echo "Please choose from the following options for nuclei templates:"
echo "1. cves"
echo "2. vulnerabilities"
echo "3. exposed-panels"
echo "4. exposures"
echo "5. file"
echo "6. miscellaneous"
echo "7. misconfiguration"
echo "8. technologies"
echo "9. All Templates (Takes Hours)"
echo "Enter the numbers separated by commas:"
read templates

if [[ $templates == *"1"* ]]; then
  t_args="$t_args -t /root/nuclei-templates/cves"
fi

if [[ $templates == *"2"* ]]; then
  t_args="$t_args -t /root/nuclei-templates/vulnerabilities"
fi

if [[ $templates == *"3"* ]]; then
  t_args="$t_args -t /root/nuclei-templates/exposed-panels"
fi

if [[ $templates == *"4"* ]]; then
  t_args="$t_args -t /root/nuclei-templates/exposures"
fi

if [[ $templates == *"5"* ]]; then
  t_args="$t_args -t /root/nuclei-templates/file"
fi

if [[ $templates == *"6"* ]]; then
  t_args="$t_args -t /root/nuclei-templates/miscellaneous"
fi

if [[ $templates == *"7"* ]]; then
  t_args="$t_args -t /root/nuclei-templates/misconfiguration"
fi

if [[ $templates == *"8"* ]]; then
  t_args="$t_args -t /root/nuclei-templates/technologies"
fi

if [[ $templates == *"9"* ]]; then
  t_args="$t_args -t /root/nuclei-templates"
fi

echo "Starting Nuclei scan with the selected templates..."
cat $dir_path/filtered_urls.txt | nuclei -stats -si 150 $t_args -o $dir_path/nuclei_results_for_$dir_name.txt 

echo "Moving temporary files to the path $dir_name..."
mv $dir_path/*.txt $dir_path/$dir_name/
