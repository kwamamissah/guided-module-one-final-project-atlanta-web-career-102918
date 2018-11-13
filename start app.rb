

def welcome
  weekday = DateTime.now.strftime('%A')
  puts "Happy #{weekday}!  I am Truly Unique <3.  Sign up or Log in"
  prompt_user = puts "S for sign up or L for login"
  response = gets.chomp.downcase
  until response == 'l' || response == 's'
    invalid_response
    prompt_user
    response = gets.chomp.downcase
  end

  if response == "l"
    log_in
  elsif response == "s"
    sign_up
  end
end
#if response = s go to sign_up
#else go to log_in


def user_input_name
  gets.chomp.downcase
end

def user_input_email
  gets.chomp.downcase
end

def invalid_response
  puts "Please put a valid response."
end



def sign_up
  puts "What's your name"
  name = gets.chomp
  puts "What's your email address?"
  email = gets.chomp
  User.create(name: name, email: email)
end

def search_email(email)
  User.find_by email: email
end

def log_in
  "What's your email address"
  email = gets.chomp.downcase
end

def greeting_return(name, mood, type)
  "Welcome back #{name}! Would you like another #{mood} #{type}?"
  prompt_user = puts "Y for Yes or N for No"
  response = gets.chomp.downcase
  until response == 'y' || response == 'n'
    invalid_response
    prompt_user
    response = gets.chomp.downcase
  end

  if response == "y"

  elsif response == "n"

  end
end

end

def greeting_new(name, mood, type)
  "Welcome #{name}! What "
end
