#Configuring Git for SSH Auth
	ssh-keygen -t ed25519 -C "e118187@rmit.edu.au" -f ~/.ssh/github_sdo_key

	vim ~/.ssh/config
	or
	nano ~/.ssh/config

	#add below 4 lines
	Host github.com
	 HostName github.com
	 PreferredAuthentications publickey
	 IdentityFile ~/.ssh/github_sdo_key
	 
	#Change the permissions
	sudo chmod 600 ~/.ssh/config

	#https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
	#See Pubblic key
	cat ~/.ssh/github_sdo_key.pub
	#Goto github.com and create SSH keys from Settings >> Access >> SSH and GPG Keys
	#Create new SSH key and paste public key contents
	
#Check SSH Auth is working
#https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection
ssh -T git@github.com

#In case of success it should show below message
#Hi ikram-ul-haq-rmit! You've successfully authenticated, but GitHub does not provide shell access.

#sdo-tools-vm setup
#cd ~/
#sudo apt install git -y		#If git not installed
#git clone git@github.com:rmit-sdo-2024-s2/cosc2759-sem1-2024-labs.git
#Correct Git url
git clone git@github.com:rmit-computing-technologies/cosc2759-2025-lab-week-2

cd cosc2759-2025-lab-week-2/

#FOR WINDOWS/WSL
 #chmod +x *.sh
 ./run-inside-vm-to-setup.sh

#Installation should take about 10 mins. It will end with below Info message:
#Installed Docker version 28.3.2, build 578ccf6

#Wait for about 10-20 secs
#Then validate
 ./validate-tools-installed.sh

#if you see docker permission error then do either of the below
	#Start docker servicewith 'sudo systemctl start docker' command
	#or
	#Exit WSL and login WSL again. Most probably docker service is only enabled but not started yet
	#Then validate again, if re-entered WSL or started docker
 	./validate-tools-installed.sh
	#The process should end-up with OK message on the last line.
#FOR MAC - outdated
	sudo snap install multipass
	sudo apt install jq -y
	./macos-create-sdo-tools-vm.sh

	#Mount to working folder
	multipass mount ~/cosc2759-devops/ sdotools:/work
	#Dont mount weekly folder like below
		"multipass mount ~/cosc2759-devops/lab3 sdotools:/work"

		#Then every week you might need to unmount and mount to new folder
		multipass umount sdotools:/work

	#Goto sdotools shell
	multipass shell sdotools

#Verify Commands
make --version		#4.3
git --version		#2.34.1
python --version	#3.10.12
curl --version		#7.81.0
node --version		#18.20.8
npm --version		#10.8.2