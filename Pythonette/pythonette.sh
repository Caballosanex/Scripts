# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    pythonette.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alexsanc <alexsanc@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/17 17:00:30 by alexsanc          #+#    #+#              #
#    Updated: 2023/05/17 17:34:50 by alexsanc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

## This program automates the installation of pycodestyle and the creation of the alias pythonette
## The alias pythonette wil be used to check your PEP8 compliance of your python files.
## It will detect if you already have pycodestyle installed and if you already have the alias pythonette.
## Pycodestyle will be installed through pip to your home directory without sudo rights. Thus you will be able to use it on the 42 computers.

## Check if pycodestyle is already installed and tries pip install and pip3 install if not installed yet.
if ! [ -x "$(command -v pycodestyle)" ]; then
	if ! [ -x "$(command -v pip)" ]; then
		if ! [ -x "$(command -v pip3)" ]; then
			echo "Error: pip and pip3 are not installed." >&2
			exit 1
		else
			pip3 install --user pycodestyle
		fi
	else
		pip install --user pycodestyle
	fi
fi

## Check if the alias pythonette is already created and if not, creates it depending on the system used. Could be .bashrc or .zshrc.
## The alias pythonette will be used to check your PEP8 compliance of your python files but it will also be able to check a whole directory.
if ! grep -q "alias pythonette" ~/.zshrc; then
	if ! grep -q "alias pythonette" ~/.bashrc; then
		if [ -f ~/.bashrc ]; then
			echo "alias pythonette='find . -name \"*.py\" -exec pycodestyle {} \;'" >> ~/.bashrc
		else
			echo "alias pythonette='find . -name \"*.py\" -exec pycodestyle {} \;'" >> ~/.zshrc
		fi
	else
		echo "The alias pythonette is already created."
	fi
else
	echo "The alias pythonette is already created."
fi

## Source the .zshrc to apply the changes.
source ~/.zshrc

## Print a message to inform the user that the alias pythonette is now available.
echo "The alias pythonette is now available. You can use it to check your PEP8 compliance of your python files."
exit 0