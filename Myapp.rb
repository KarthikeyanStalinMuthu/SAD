
require 'rubygems'
require 'pony'
require 'sinatra'
require 'mail'
require'json'

#read_Sqlite ( Ruby code  for connecting the sqlite database)
require_relative 'read_sqlite'

# Folder Assets contains all the static files
set :public_folder, File.dirname(__FILE__) + '/assets'

###### INDEX PAGE ###########
# referring the index page (which is converted into .erb format)
get '/' do
erb :index
end

####### CAMPUS NEWS PAGE ####
get '/campusnews/' do
# call the campusnews form
	erb :campusnews
end

####### JOINUS PAGEE #########
get '/joinus/' do
# Calling the joinus.erb form
	erb :joinus
end	

post '/joinus/' do
# Get the values from the joinus.erb page
	name = params[:name]					#name
	email = params[:email]					#Email
	subject = params[:subject]				#Subject
	message = params[:message]				#Message

	namen = name

# To send a mail from Joinus Page
	Pony.mail(:to => 'karthikeyan_464@yahoo.co.in',
	 :body => "NAME :".concat(name).concat("  ").concat("Email: ").concat(email)
	 			.concat("  ").concat("Message: ").concat(message))

# populating success message to the user through another .erb page
	erb :join, :locals=>{'name' => namen}
end	

####### SPORTS PAGE #####
get '/sports/' do
# call the sports form
	erb :sports
end

####### EDUCATIONAL PAGE #####

get '/EDUCATIONAL/' do
# call the educatioanl form
	erb :educatioanl
end

####### SEARCH PAGE ############
get '/search/'do
#Calling the Search.erb file
	erb :search
end

post '/search/' do
# 1. Get the values from the Search input box 
# 2. Display the data
 search = params[:search]				#Search box Value

#Object Instantiation 
obj = Read_value.new

#Calling the methods (intialize & Read)
# Calling and storing the values to the variable and array
result = obj.intialize(search)

#puts "you are searching  :#{result}" 

# to get content of the file (Passing the content to the string--> content)
content = obj.read

#populating the retrieved nessage in a form
 erb :searc, :locals=>{'search' => content}
end

###### MISCELLANEOUS PAGE #####

get '/miscellaneous/' do
# call the misceallneous form
	erb :misceallneous
end
####### SRH MUSIC PAGE #####

get '/srhmusic/' do
# call the srhmusic form
	erb :srhmusic
end
