#!/bin/bash
curl --silent "https://raw.githubusercontent.com/blackhatethicalhacking/Subdomain_Bruteforce_bheh/main/ascii.sh" | lolcat
echo ""
# Generate a random Sun Tzu quote for offensive security
# Array of Sun Tzu quotes
quotes=("The supreme art of war is to subdue the enemy without fighting." "All warfare is based on deception." "He who knows when he can fight and when he cannot, will be victorious." "The whole secret lies in confusing the enemy, so that he cannot fathom our real intent." "To win one hundred victories in one hundred battles is not the acme of skill. To subdue the enemy without fighting is the acme of skill.")
# Get a random quote from the array
random_quote=${quotes[$RANDOM % ${#quotes[@]}]}
# Print the quote
echo "Offensive Security Tip: $random_quote - Sun Tzu" | lolcat
sleep 1
echo "MEANS, IT'S ☕ 1337 ⚡ TIME, 369 ☯ " | lolcat
sleep 1
figlet -w 80 -f small NucleiMonst3r | lolcat
echo ""
echo "[YOUR ARE USING NucleiMonst3r.sh] - (v1.0) CODED BY Chris 'SaintDruG' Abou-Chabké WITH ❤ FOR blackhatethicalhacking.com for Educational Purposes only!" | lolcat
sleep 1
#check if the user is connected to the internet
tput bold;echo "CHECKING IF YOU ARE CONNECTED TO THE INTERNET!" | lolcat
# Check connection
wget -q --spider https://google.com
if [ $? -ne 0 ];then
    echo "++++ CONNECT TO THE INTERNET BEFORE RUNNING NucleiMonst3r.sh!" | lolcat
    exit 1
fi
tput bold;echo "++++ CONNECTION FOUND, LET'S GO!" | lolcat
# get domain name from user input
echo "Enter Domain:"
read domain

# create a directory with the domain name of the website

echo "Creating directory for output files..."
mkdir "$domain"

# Fetching URLs for website and filtering by specific extensions please wait...
echo "Fetching URLs for $domain and filtering by specific extensions..."
waybackurls $domain | grep -E "(\.js|\.css|\.php|\.asp|\.aspx|\.jsp|\.json|\.html|\.xml)$" | tee $domain/filtered_urls.txt

# Checking filtered URLs with httpx and saving the output in httpx_output.txt...
echo "Checking filtered URLs with httpx and saving the output in httpx_output.txt..."
cat $domain/filtered_urls.txt | httpx -silent | tee $domain/httpx_output.txt

echo "Please choose from the following options for nuclei templates:"
echo "1. cves"
echo "2. vulnerabilities"
echo "3. exposed-panels"
echo "4. exposures"
echo "5. file"
echo "6. miscellaneous"
echo "7. misconfiguration"
echo "8. technologies"
echo "9. All Templates AKA Hail Mary (Takes Hours)"
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
cat $domain/httpx_output.txt | nuclei -stats -si 100 $t_args -o $domain/nuclei_results_for_$domain.txt 
