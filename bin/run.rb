require_relative '../config/environment'
require_relative '../bin/menu.rb'
require_relative '../bin/menu_class.rb'

#Directly runs the menu
menu = Menu.new
menu.start
