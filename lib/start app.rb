


def welcome
  weekday = DateTime.now.strftime('%A')
  puts "Happy #{weekday}!  I am Truly Unique <3.  Sign up or Log in"
  prompt_user = puts "Sign up = S Login = L"
  response = STDIN.gets.chomp
  until response.downcase == 'l' || response.downcase == 's'
    invalid_response
    prompt_user
    response = STDIN.gets.chomp
  end

  if response.downcase == "l"
    log_in
  elsif response.downcase == "s"
    sign_up
  end
end
#if response = s go to sign_up
#else go to log_in


def user_input_name
  STDIN.gets.chomp
end

def user_input_email
  STDIN.gets.chomp
end

def invalid_response
  puts "Please put a valid response."
end



def sign_up
  puts "What's your name"
  name = STDIN.gets.chomp
  puts "What's your email address?"
  email = STDIN.gets.chomp
  User.create(name: name, email: email)
end

def search_email(email)
  User.find_by email: email
end

def log_in
  puts "What's your email address"
  email = STDIN.gets.chomp

  until User.find_by(email: email) != nil
    puts "Please put a valid email"
    email = STDIN.gets.chomp
  end
  sb_greeting
end

def sb_greeting
  puts  "Would you like a poem or a quote?"
  prompt_user = puts "Poem = P Quote = Q"
  quote_or_poem = STDIN.gets.chomp.downcase
end

def greeting_return(name, mood, type)
  puts "Welcome back #{name}! Would you like another #{mood} #{type}?"
  prompt_user = puts "Y for Yes or N for No"
  response = STDIN.gets.chomp
  until response.downcase == 'y' || response.downcase == 'n'
    invalid_response
    prompt_user
    response = STDIN.gets.chomp
  end

  if response == "y"

  elsif response == "n"

  end
end


def greeting_new(name, mood, type)
  "Welcome #{name}! What "
end
