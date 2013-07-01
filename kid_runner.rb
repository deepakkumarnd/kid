require './lib/kid.rb'

kid = Kid::Kid.new
kid.learn_from_file('data.json')
