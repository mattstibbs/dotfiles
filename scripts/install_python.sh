brew cask install Python
brew cask install python3

export PIP_REQUIRE_VIRTUALENV=false
pip install virtualenv
pip install virtualenvwrapper

export WORKON_HOME=~/Envs
export PROJECT_HOME=~/Source
source /usr/local/bin/virtualenvwrapper.sh
