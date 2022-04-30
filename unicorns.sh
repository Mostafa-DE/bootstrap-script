#!/usr/bin/zsh
#Mostafa-DE :)


# This script for open your project { Frontend & Backend } by just run the script in your terminal
# First of all you have to specify multiple things ==>
# 1) Change EDITOR_NAME variable to the editor that you using (VSCode, PyCharm)
# 2) change PROJECT_NAME to your project's name
# 3) specify PATH_FRONTEND and PATH_BACKEND by going to your project's directory and enter { pwd } command
# 4) change NPM_SCRIPT_FRONTEND to your script that will run the frontend and do the same for the NPM_SCRIPT_BACKEND
 
# After you finish, we almost done.
# Now go to zshrc by run { vim ~/.zshrc }.
# After you open zshrc file put { alias <name of your script>="<name of your file end with .sh>" }.
# After that exit and run source ~/.zshrc to refresh.
# Now you ready to go, try to run <name of your script> that you specified in zshrc file

# Extra Information ==>
# 1) you can add many path you want BACKEND_PATH for example
# 2) if you are using VSCode don't forget to uncomment VSCode script and comment PyCharm script, 
# anything with { pycharm-professional } should replace with { code }
# 3) when you run the script you will ask if you want to run the server if you enter n it will open just the frontnd 

echo "Do you want to run the server also? [y/n]"
read option
typeset -l option # this line for case-sensetive

EDITOR_NAME="PyCharm"

PROJECT_NAME="Unicorns"

PATH_FORNTEND=/home/mostafa-de/Desktop/codes/unicorns-frontend
PATH_BACKEND=/home/mostafa-de/Desktop/codes/unicorns-backend

NPM_SCRIPT_FRONTEND="npm run dev"
NPM_SCRIPT_BACKEND="npm run develop"


if [[  $option == "y" ]]
then
	echo "Do you want to open the backend on editor? [y/n]"
	read openEditor
	typeset -l openEditor
	
	if [[ $openEditor == "y" ]]
	then
		# For VS code 
		  #code $PATH_FORNTEND
		  #code $PATH_BACKEND
		
		# For PyCharm  
		  gnome-terminal --tab --title="$EDITOR_NAME Frontend & Backend" -- zsh -c "pycharm-professional $PATH_FORNTEND; zsh"
		  sleep 5 # we have to wait for 5 sec until PyCharm launched
		  pycharm-professional $PATH_BACKEND

	elif [[ $openEditor == "n" ]]
	then	
		# For VS code 
                #  code $PATH_FORNTEND

                # For PyCharm  
                  gnome-terminal --tab --title="$EDITOR_NAME Frontend" -- zsh -c "pycharm-professional $PATH_FORNTEND; zsh"

	else
		echo "Unrecognized option !! please enter y option for [yes] or n option for [no]"
        	exec $0
	fi
	gnome-terminal --tab --title="$PROJECT_NAME Frontend" -- zsh -c "cd $PATH_FORNTEND; $NPM_SCRIPT_FRONTEND; zsh"
        gnome-terminal --tab --title="$PROJECT_NAME Backend" -- zsh -c "cd $PATH_BACKEND; $NPM_SCRIPT_BACKEND; zsh"


elif [[ $option == "n" ]]
then
	# For VS code
          #code $PATH_FORNTEND
	  # gnome-terminal --tab --title="Unicorn Frontend" -- zsh -c "cd $PATH_FORNTEND; $NPM_SCRIPT_FRONTEND; zsh"
	
	# For PyCharm
	gnome-terminal --tab --title="$EDITOR_NAME Frontend" -- zsh -c "pycharm-professional $PATH_FORNTEND; zsh"
	gnome-terminal --tab --title="$PROJECT_NAME Frontend" -- zsh -c "cd $PATH_FORNTEND; $NPM_SCRIPT_FRONTEND; zsh"
else 
	echo "Unrecognized option !! please enter y option for [yes] or n option for [no]"
	exec $0
fi

$SHELL


