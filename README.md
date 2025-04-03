# BHEH's Nucleimonst3r

<p align="center">
<a href="https://www.blackhatethicalhacking.com"><img src="https://www.blackhatethicalhacking.com/wp-content/uploads/2022/06/BHEH_logo.png" width="300px" alt="BHEH"></a>
</p>

<p align="center">

**Nucleimonst3r - Unleashing the Red Fury**

Nucleimonst3r is written by Chris "SaintDruG" Abou-Chabke from Black Hat Ethical Hacking and is designed for Red Teams and Bug Bounty Hunters!
</p>

# Description

Nucleimonst3r is a high-speed vulnerability scanner designed for Bug Bounty Hunters and Red Teamers who need to quickly and efficiently identify potential targets for attack. The tool fetches URLs for a given domain and filters them based on specific extensions. The filtered URLs are then checked using the httpx tool and the results are saved in a file named "httpx_output.txt". This output is used by nuclei to scan the URLs for vulnerabilities using a prompt that will ask you what templates you want to run with some combination and a 'Hail Mary' option that lets you use all templates which get updated every time you run the tool. The templates are located at /root/nuclei-templates/.

The tool offers several options for customizing the scan, including the ability to specify a custom path for saving results and to display statistics about the running scan. The statistics can be displayed in the terminal or written to an output file in JSON(Lines) format. The user can also specify the number of seconds to wait between showing a statistics update.


# Features:

- Advanced Scanning Techniques: Nucleimonst3r is equipped with advanced scanning techniques that allow you to perform deep, comprehensive scans of your target website. The tool can be configured to look for specific vulnerabilities and security weaknesses, making it easy to identify potential threats and remediate them before they can be exploited.

- Dynamic Template Generation: Nucleimonst3r includes an innovative feature that allows you to dynamically generate custom scanning templates based on the characteristics of your target website. This makes it possible to tailor the scan to your specific needs, ensuring that you get the most relevant and accurate results.

- Real-Time Scan Statistics: Nucleimonst3r provides real-time scan statistics that give you detailed information about the progress of the scan. You can see how many URLs have been scanned, how many vulnerabilities have been found, and how much time the scan has taken, all in real-time.

- Comprehensive Report Generation: Nucleimonst3r generates comprehensive reports of the scan results, which can be used to review and analyze the findings. These reports include detailed information about the vulnerabilities that were found, including their severity and potential impact.

- Integration with Other Tools: Nucleimonst3r integrates with other tools, such as httpx and waybackurls, to provide a complete solution for website security testing. This integration makes it easy to combine the strengths of these tools to get the best results, and helps streamline the security testing process.

# Requirements:

To use Nucleimonst3r, you need to have the following tools installed:

- nuclei: Nucleimonst3r requires nuclei to be installed on the system. To install nuclei on Kali Linux, use the following command:

`go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest`

- httpx: Nucleimonst3r also requires httpx to be installed on the system. To install httpx on Kali Linux, use the following command:

`go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest`

- waybackurls: can be installed: `go install github.com/tomnomnom/waybackurls@latest`

To install the required tools and ensure that the location of templates is set to `/root/nuclei-templates/`, the user should follow these steps:

- Install Go on the system by following the instructions at https://golang.org/doc/install.
- Clone the nuclei and httpx repositories from GitHub.
- Build and install nuclei and httpx using the above-mentioned commands.
- Install figlet & lolcat,toilet for the cool Rainbow Colors! `pip install lolcat` and `apt-get install figlet`,`apt-get install toilet`
- Create a folder named "nuclei-templates" in the /root/ directory and copy the required templates to this folder.

# Installation

`git clone https://github.com/blackhatethicalhacking/Nucleimonst3r.git`

`cd Nucleimonst3r`

`chmod +x Nucleimonst3r.sh`

`./Nucleimonst3r.sh`

- The script will prompt you to provide the domain
- Then it will ask you to choose templates

# Screenshot

**Main Menu**

![Screenshot_2023-07-14_00_43_55](https://github.com/blackhatethicalhacking/Nucleimonst3r/assets/13942386/296e95e5-ad33-4ccc-abe2-ad04b39c37d6)

![Screenshot_2023-07-14_01_17_16](https://github.com/blackhatethicalhacking/Nucleimonst3r/assets/13942386/feed137a-038b-4b6b-93d7-f834c627154d)


# Compatibility: 

This tool has been tested on Kali Linux, Ubuntu and MacOS.

# Disclaimer

This tool is provided for educational and research purpose only. The author of this project are no way responsible for any misuse of this tool. 
We use it to test under NDA agreements with clients and their consents for pentesting purposes and we never encourage to misuse or take responsibility for any damage caused !

<h2 align="center">
  <a href="https://store.blackhatethicalhacking.com/" target="_blank">BHEH Official Merch</a>
</h2>

<p align="center">
Introducing our Merch Store, designed for the Offensive Security community. Explore a curated collection of apparel and drinkware, perfect for both professionals and enthusiasts. Our selection includes premium t-shirts, hoodies, and mugs, each featuring bold hacking-themed slogans and graphics that embody the spirit of red teaming and offensive security. 
Hack with style and showcase your dedication to hacker culture with gear that’s as dynamic and resilient as you are. 😊
</p>

<p align="center">

<img src="https://github.com/blackhatethicalhacking/blackhatethicalhacking/blob/main/Merch_Promo.gif" width="540px" height="540">
  </p>

