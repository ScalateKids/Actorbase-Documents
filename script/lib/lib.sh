#!/bin/bash
#
# Library file, containing project constant for ScalateKids, this SHOULD BE NOT
# executable
# Author: Andrea Giacomo Baldan
# Version: 1.0

function is_osx() {
	[ "$(uname)" == 'Darwin' ]
	return $?;
}

function set_red() {
	if is_osx; then
		echo -ne "\033[31m"
	else
		echo -ne "\e[31m"
	fi
}

function set_green() {
	if is_osx; then
		echo -ne "\033[32m"
	else
		echo -ne "\e[32m"
	fi
}

function set_bold() {
	if is_osx; then
		echo -ne "\033[1m"
	else
		echo -ne "\e[1m"
	fi
}

function set_yellow() {
	if is_osx; then
		echo -ne "\033[33m"
	else
		echo -ne "\e[33m"
	fi
}

function reset_color() {
	if is_osx; then
		echo -ne "\033[39m"
	else
		echo -ne "\e[39m"
	fi
}

function reset_text() {
	if is_osx; then
		echo -ne "\033[0m"
	else
		echo -ne "\e[0m"
	fi
}
