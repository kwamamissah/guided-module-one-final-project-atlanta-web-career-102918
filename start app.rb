

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
  
end
#if response = s go to get info
#else go to log_in


def user_input_name
  gets.chomp.downcase
end

def user_input_email
  gets.chomp.downcase
end



def hit?(card_total)
  prompt_user
  input = get_user_input
  until input == 'h' || input == 's'
    invalid_command
    prompt_user
    input = get_user_input
  end
  if input == 'h'
    card_total += deal_card
  elsif input == 's'
    card_total
  end
end


def invalid_response
  puts "Please put S or L"
end



def sign_up
  puts "What's your name"
  name = gets.chomp
  puts "What's your email address?"
  email = gets.chomp
end

def search_email(email)
  User.find_by email: email
end

def log_in
  "What's your email address"
  email = gets.chomp.downcase
end
