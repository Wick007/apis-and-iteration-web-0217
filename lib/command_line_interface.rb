def welcome
  puts "Welcome Trekki!"
end

def get_character_from_user
  puts "please enter a character"
  character = gets.chomp
  character = character.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
