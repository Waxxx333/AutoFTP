#!/bin/bash
WHITE=('\033[38;5;15m');
GREEN=('\033[38;5;46m');
DARK=('\033[38;5;245m');
BLUE=('\033[38;5;51m');
RED=('\033[38;5;1m');
BOLD=('\033[01m');
ORANGE=('\033[38;5;202m');
UNDERLINE=('\033[04m');
STRIKE=('\033[09m');
DIM=('\033[2m');
RESET=('\033[0m');
BLINK=('\033[5m');
Version=('V-0.2');
filename=$(basename $0)
if [[ ${#1} -le 1 ]]; then
	usage
fi
# Determine if user is root or not
if [[ $UID != 0 ]]; then
    export user=${USER}
else
    export user=root
fi
# Detect distro
if grep -q "bian" /etc/os-release; then 
	export OS='Debian'
elif grep -q 'arch' /etc/os-release; then
	export OS='Arch'
fi
# Detect shell
if echo $SHELL | grep -qi "zsh";
  then
    export user_shell="zsh"
elif echo $SHELL | grep -qi "bash";
  then
    export user_shell="bash";
else
    export user_shell='bash';
fi
echo -e "${RED}          :xXMMMMXx:     "
echo -e "${RED}     .ckXMMMMMMMMMMMMXkc.     "
echo -e "${RED}   oNMMMMMMMMMMMMMMMMMMMMNo     "
echo -e "${RED} .WMMMMMMMMMMMMMMMMMMMMMMMMW.     "
echo -e "${RED} WMMMMMMMMMMMMMMMMMMMMMMMMMMW     "
echo -e "${RED}xMMMMMMMMMMMMMMMMMMMMMMMMMMMMk     "
echo -e "${RED}MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM     "
echo -e "${RED}xMW .:OWMMMMMMMMMMMMMMWOc. NMO     "
echo -e "${RED} MM.    ,o0WMMMMMMW0o,    .WM     "
echo -e "${RED}  NK:.      ,OMMO,      .;KW     "
echo -e "${RED}   xMMMNKOOXMK::KMXOOKNMMMk     "
echo -e "${RED}  oMMMMM0;MMW.od.WMM;OMMMMMd     "
echo -e "${RED}  .MMM:   MMM0MM0MMM   :MMM.     "
echo -e "${RED}          WMxMkdMxMW     "
echo -e "${RED}          cM:MdlM:Ml     "
echo -e "${RED}          ,M,MdoM,M;     "
echo -e "${RED}          .M.MdoM.M.     "
echo -e "${RED}          .M.NolW.M.     "
echo -e "${RED}           d.0c:K.x     "
echo -e "			${DARK}╔══════════════════════╗"
echo -e "			${DARK}║${GREEN} ┳━┓${DARK}┳ ┓┏┓┓┏━┓${BLUE}┳━┓┏┓┓┳━┓${DARK}║"
echo -e "			${DARK}║${GREEN} ┃━┫${DARK}┃ ┃ ┃ ┃ ┃${BLUE}┣━  ┃ ┃━┛${DARK}║"
echo -e "			${DARK}║${GREEN} ┛ ┇${DARK}┇━┛ ┇ ┛━┛${BLUE}┇   ┇ ┇  ${DARK}║"
echo -e "			${DARK}║        ${DIM}${GREEN}${Version}${RESET}${BOLD}         ${DARK}║"
echo -e "			${DARK}╚══════════════════════╝"
loading() {
	zero='0'
	e=(' ⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏ ')
	g=('↰ ↱ ↲ ↳')
	d=(' ◜ ◠ ◝ ◞ ◡ ◟ ')
	echo -e $ORANGE
	for i in {1..10}; do
		for z in ${e[@]}; do
			printf "\r$z $i$zero%%"
			sleep 0.01
	done
	done 
	echo 
	return
}

completion() {
	if [[ -d /usr/share/bash-completion ]]; then
		sudo cp autoftp.completion /usr/share/bash-completion/completions
		if [[ ${user_shell} = 'zsh' ]]; then
			echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Setting up tab completion for ${GREEN}${USER}${WHITE}-${GREEN}${user_shell} ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
			if grep -q "autoftp.completion" $HOME/.zshrc; then
				echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Completion script found already${WHITE}. ${RED}Doing nothing ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
			elif ! grep -q 'autoftp.completion' $HOME/.zshrc; then
				echo 'autoload bashcompinit' >> $HOME/.zshrc
				echo 'bashcompinit' >> $HOME/.zshrc
				echo 'autoload -U +X compinit && compinit' >> $HOME/.zshrc
				echo 'source /usr/share/bash-completion/completions/autoftp.completion' >> $HOME/.zshrc	
				echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Completion script added${WHITE}.${GREEN} Restart your shell for changes to take effect${WHITE}.${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
			fi
		elif [[ ${user_shell} = 'bash' ]]; then
			echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Setting up tab completion for ${GREEN}${USER}${WHITE}-${GREEN}${user_shell} ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
			if grep -q "autoftp.completion" $HOME/.bashrc; then
				echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Completion script found already${WHITE}. ${RED}Doing nothing ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
			elif ! grep -q 'autoftp.completion' $HOME/.bashrc; then
				echo "source /usr/share/bash-completion/completions/autoftp.completion" >> $HOME/.bashrc
			fi
		fi
	else
		echo -e "${DARK}[${RED}!${DARK}]${RED} The tab completion package is not installed in your system ${DARK}[${RED}!${DARK}]"
		echo -e "${BLUE}It is not required to have this package installed${WHITE}. ${BLUE}You can choose ${RED}no${BLUE} if you${WHITE}'${BLUE}d like"
		echo -e "${GREEN}Install now ${WHITE}? ${DARK}[${BLUE}yes${WHITE}/${RED}no${DARK}]"
		read -p "[ ${USER}@AutoFTP ~ ]$ " answer2
		if [[ ${answer2} == [yY] || ${answer2} == [yY][eE][sS] ]]; then
			echo -e "${GREEN}Detecting your distro"
			if [[ ${OS} = 'Debian' ]]; then
				sudo apt install bash-completion
				completion
			elif [[ ${OS} = 'Arch' ]]; then
				sudo pacman -S bash-completion
				completion
			fi
		elif [[ ${answer2} == [nN] || ${answer2} == [nN][oO] ]]; then
			echo -e "${DARK}[${RED}!${DARK}]${RED} Not installing package${WHITE}: '${GREEN}bash-completion${WHITE}'.${BLUE} Copying included completion files to your system${WHITE}. ${DARK}[${RED}!${DARK}]"
			sudo mkdir -p /usr/share/autoftp/completion
			sudo cp autoftp.completion /usr/share/autoftp/completion/autoftp.completion
			if [[ ${user_shell} = 'zsh' ]]; then
				if grep -q "autoftp.completion" $HOME/.zshrc; then
					echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Completion script found already${WHITE}. ${RED}Doing nothing ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
				elif ! grep -q 'autoftp.completion' $HOME/.zshrc; then
					echo 'autoload bashcompinit' >> $HOME/.zshrc
					echo 'bashcompinit' >> $HOME/.zshrc
					echo 'autoload -U +X compinit && compinit' >> $HOME/.zshrc
					echo 'source /usr/share/autoftp/completion/autoftp.completion' >> $HOME/.zshrc	
					echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Completion script added${WHITE}.${GREEN} Restart your shell for changes to take effect${WHITE}.${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
				fi
			elif [[ ${user_shell} = 'bash' ]]; then
				if grep -q "autoftp.completion" $HOME/.bashrc; then
					echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Completion script found already${WHITE}. ${RED}Doing nothing ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
				elif ! grep -q 'autoftp.completion' $HOME/.bashrc; then
					echo "source /usr/share/autoftp/completion/autoftp.completion" >> $HOME/.bashrc
				fi
			fi
		fi
	fi
}

info() {
	echo -e "${DARK}Script ${GREEN}A${DARK}uto${BLUE}FTP info${WHITE}:
	${GREEN}A${DARK}uto${BLUE}FTP is an automated brute force script written in python${WHITE}.
	${BLUE}You have the option of using a local wordlist or remote wordlists${WHITE}.
	${BLUE}This script also features bash completion and tab completion${WHITE}. ${BLUE}When at an input function${WHITE}, 
	${BLUE}press tab to see the available completions${WHITE}.
	${BLUE}For the bash-completion${WHITE}, ${BLUE}you${WHITE}'${BLUE}ll need to install this script${WHITE}"
}
usage() {
	echo -e ${BLUE}"${GREEN}A${DARK}uto${BLUE}FTP Installation Options:
	${DARK}-r  ${BLUE}Install requirements and run without installing 
	${DARK}-t  ${BLUE}Install requirements and install script 
	${GREEN}Usage${WHITE}: .${GREEN}/${DARK}$filename ${DARK}-[${BLUE}option${DARK}]"
	return
}

run() {
	echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Running ${GREEN}A${DARK}uto${BLUE}FTP ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
	loading
	echo -e "${DARK}[${RED}!${DARK}]${RED} Installing necessary dependencies to run ${GREEN}A${DARK}uto${BLUE}FTP${WHITE}. ${DARK}[${RED}!${DARK}]"
	if [[ ${OS} = 'Debian' ]]; then
		sudo cp /usr/bin/python3 /usr/bin/python
		sudo apt-get install python3-distutils
		sudo apt-get install python3-apt
	fi
}

install() {
	if [[ ${user_shell} = 'bash' ]]; then
		if grep -q "autoftp.completion" $HOME/.bashrc; then
			echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Installing ${GREEN}A${DARK}uto${BLUE}FTP ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
			loading
			sudo cp autoftp /usr/bin/ && sudo chmod +x /usr/bin/autoftp && sudo /bin/pip install -r requirements.txt
			if [[ ${OS} = 'Debian' ]]; then
				sudo cp /usr/bin/python3 /usr/bin/python
				sudo apt-get install python3-distutils
				sudo apt-get install python3-apt
			fi
			echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${GREEN}A${DARK}uto${BLUE}FTP ${GREEN} has been installed ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
			loading
		else
			echo -e "${DARK}[${RED}!${DARK}]${BLUE} Tab completion for ${GREEN}A${DARK}uto${BLUE}FTP ${BLUE}is not found in system${WHITE}. ${DARK}[${RED}!${DARK}]"
			echo -e "${GREEN}Install now ${WHITE}? ${DARK}[${BLUE}yes${WHITE}/${RED}no${DARK}]"
			read -p "[ ${USER}@AutoFTP ~ ]$ " answer3
			if [[ ${answer3} == [yY] || ${answer3} == [yY][eE][sS] ]]; then
				completion
			elif [[ ${answer3} == [nN] || ${answer3} == [nN][oO] ]]; then
				echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Proceed with installation of ${GREEN}A${DARK}uto${BLUE}FTP ${BLUE}without tab completion installation ${WHITE}? ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
			else
				install
			fi
		fi
	elif [[ ${user_shell} = 'zsh' ]]; then
		if grep -q "autoftp.completion" $HOME/.zshrc; then
			echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Installing ${GREEN}A${DARK}uto${BLUE}FTP ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
			loading
			sudo cp autoftp /usr/bin/ && sudo chmod +x /usr/bin/autoftp && sudo /bin/pip install -r requirements.txt
			if [[ ${OS} = 'Debian' ]]; then
				sudo cp /usr/bin/python3 /usr/bin/python
				sudo apt-get install python3-distutils
				sudo apt-get install python3-apt
			fi
			echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${GREEN}Auto${RED}FTP ${GREEN} has been installed ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
			loading
		else
			echo -e "${DARK}[${RED}!${DARK}]${RED} Tab completion for ${GREEN}A${DARK}uto${BLUE}FTP is not found in system${WHITE}. ${DARK}[${RED}!${DARK}]"
			echo -e "${GREEN}Install now ${WHITE}? ${DARK}[${BLUE}yes${WHITE}/${RED}no${DARK}]"
			read -p "[ ${USER}@AutoFTP ~ ]$ " answer3
			if [[ ${answer3} == [yY] || ${answer3} == [yY][eE][sS] ]]; then
				completion
			elif [[ ${answer3} == [nN] || ${answer3} == [nN][oO] ]]; then
				echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Proceed with installation of ${GREEN}Auto${RED}FTP ${BLUE}without tab completion installation ${WHITE}? ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
			else
				install
			fi
		fi
	else
		echo -e "Finish this block. Shell not found"
	fi	
}

# Check if pip is installed
if ! command -v pip &> /dev/null
then
	echo -e "${DARK}[${RED}!${DARK}] ${BLUE}Python pip isn't installed and it's needed to install the dependencies for this script ${DARK}[${RED}!${DARK}]"
	echo -e "${DARK}Install now ?${DARK}[${BLUE}yes${WHITE}/${RED}no${DARK}]"
	read -p "[ ${USER}@AutoFTP ~ ]$ " answer
	if [[ ${answer} == [yY] || ${answer} == [yY][eE][sS] ]]; then
		echo -e "${GREEN}This package will allow you to download Python libraries in the futrue${WHITE}. ${GREEN}It${WHITE}'${GREEN}s good to have${WHITE}."
		if [[ ${user} != 'root' ]]; then 
			echo -e "${DARK}[${RED}!${DARK}]${RED} You're going to need sudo to install this package ${DARK}[${RED}!${DARK}]"
			echo -e "Press any key to continue"
			read -n 1
		fi
	sudo curl -s https://bootstrap.pypa.io/get-pip.py -o /bin/pip && sudo chmod -v +x /bin/pip 
	#sudo /bin/pip install requests
	echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Run this script again ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
	elif [[ ${answer} == [nN] || ${answer} == [nN][oO] ]]; then
		echo -e "${DARK}[${RED}!${DARK}]${RED} You cannot use this script without the necessary dependencies ${DARK}[${RED}!${DARK}]"
	else 
		echo -e "${DARK}[${RED}!${DARK}]${RED} Invalid choice ${DARK}[${RED}!${DARK}]"
		./${filename}
	fi
#else
	#echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} pip is installed ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
fi
# Check if Python is installed
if ! command -v python3 &> /dev/null
then
	echo -e "${DARK}[${RED}!${DARK}] ${BLUE}Python isn't installed and it's needed to install the dependencies for this script ${DARK}[${RED}!${DARK}]"
	echo -e "${DARK}Install now ?${DARK}[${BLUE}yes${WHITE}/${RED}no${DARK}]"
	read -p "[ ${USER}@AutoFTP ~ ]$ " answer
	if [[ ${answer} == [yY] || ${answer} == [yY][eE][sS] ]]; then
		echo -e "${GREEN}This package is a necessity in any type of pentesting${WHITE}. ${GREEN}It${WHITE}'${GREEN}s a must-have${WHITE}."
		if [[ ${user} != 'root' ]]; then 
			echo -e "${DARK}[${RED}!${DARK}]${RED} You're going to need sudo to install this package ${DARK}[${RED}!${DARK}]"
			echo -e "Press any key to continue"
			read -n 1
		fi
	if [[ ${OS} = 'Debian' ]]; then
		sudo apt install python3
	elif [[ ${OS} = 'Arch' ]]; then
		sudo pacman -S python3
	fi
	#sudo curl -s https://bootstrap.pypa.io/get-pip.py -o /bin/pip && sudo chmod -v +x /bin/pip 
	#sudo /bin/pip install -r requirements.txt
	#sudo /bin/pip install requests
	echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} Run this script again ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
	elif [[ ${answer} == [nN] || ${answer} == [nN][oO] ]]; then 
		echo -e "${DARK}[${RED}!${DARK}]${RED} You cannot use this script without the necessary dependencies ${DARK}[${RED}!${DARK}]"
	else 
		echo -e "${DARK}[${RED}!${DARK}]${RED} Invalid choice ${DARK}[${RED}!${DARK}]"
		./${filename}
	fi
#else
	#echo -e "${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]${BLUE} pip is installed ${DARK}[${GREEN}-${WHITE}*${GREEN}-${DARK}]"
fi
while getopts "rihu" opt; do
  case "$opt" in
    r) run	# Install requirements and run without installing
        ;;
	i) install	# Install
        ;;	
	u) info    # Script info
		;;
    h)  usage	# HELP MENU
		;;
esac
done  