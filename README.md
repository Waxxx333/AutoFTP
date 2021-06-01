[![Python Version](https://img.shields.io/badge/Python-V3-%3Cgreen.svg)](https://shields.io/)
[![Requests](https://badge.fury.io/py/requests.svg)](https://badge.fury.io/py/requests)
[![Argparse](https://badge.fury.io/py/argparse.svg)](https://badge.fury.io/py/argparse)
[![Time](https://badge.fury.io/py/time.svg)](https://badge.fury.io/py/time)
# AutoFTP
FTP brute force script written in Python 3 that has the option of using your own wordlists or
scrape wordlists from GitHub.
* ***Currenlty contains 12 wordlists with over*** **17,580,792** ***words***
* ***Has*** **rockyou.txt**
* **Uses threading**
![SS](https://imgur.com/fCY8PcA.png)
<br><a href="https://www.youtube.com/watch?v=1uzuJgQCCHo"><b><p align="center">🠋 Click the screenshot below to watch the demo 🠋</p></b></a>
[![Demo](https://imgur.com/Siw2THn.png)](https://www.youtube.com/watch?v=1uzuJgQCCHo)

```
AutoFTP Usage:
FTP brute force attack that has the feature of using local or remote wordlists.
A total of 17,580,792 words currently and more soon to come
# Local wordlist attack syntax:
autoftp -t 192.168.56.104 -u admin -w dictionary.txt
# Remote wordlist mode syntax:
autoftp -t 192.168.56.104 -u admin -o darkc0de.txt
# Anonymous login syntax:
autoftp -u anonymous -t ftp.ed.ac.uk
# List all available remote wordlists and their word count:
autoftp -l
# Show an exact total remote word count
autoftp -c
```
#### More wordlists will be added. Feel free to throw suggestions for specific wordlists and I'll take them into consideration
<p align="center">
  <img width="120" height="120" src="https://imgur.com/WFurHjU.png">
</p>
