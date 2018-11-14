class CLI

  def initialize
    @user = nil
    @rating = nil
  end

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

  def invalid_response
    puts "Please put a valid response."
  end

  def sign_up
    puts "What's your name"
    name = STDIN.gets.chomp
    puts "What's your email address?"
    email = STDIN.gets.chomp
    @user = User.create(name: name, email: email)
    #instance variable, put it at the end of the method,
    post_login
    #change later
  end

  def search_email(email)
    User.find_by email: email
  end

  def get_ratings
    puts "We love feedback! Please rate how this made you feel."
    prompt_user = puts "On a scale of 1-5 \n
    1 = Eh, maybe try writing better content. 5 = This is exactly what I needed!"
    rating = STDIN.gets.chomp.to_i
    until rating >= 1 && rating <= 5
      invalid_response
      prompt_user
      rating = STDIN.gets.chomp.to_i
    end
    puts "Thanks for your feedback! Keep flourishing (:"
    @rating = rating
  end

  def log_in
    puts "What's your email address"
    email = STDIN.gets.chomp

    until search_email(email) != nil
      puts "Please put a valid email"
      email = STDIN.gets.chomp
    end

    @user = User.find_by email: email
    
    post_login
  end


  def poem_or_quote
    puts  "Would you like a poem or a quote?" #potentially put person's name in question
    prompt_user = puts "Poem = P Quote = Q"
    poem_or_quote = STDIN.gets.chomp.downcase
    until poem_or_quote == 'p' || poem_or_quote == 'q'
      invalid_response
      prompt_user
      poem_or_quote = STDIN.gets.chomp.downcase
    end
    if poem_or_quote == 'p'
      'poem'
    else
      'quote'
    end
  end



  def define_mood

    puts "What kind of mood are you feeling today?" #potentially put person's name in question
    prompt_user = puts "Encouragement = E Love = L Funny = F"
    mood = STDIN.gets.chomp.downcase
    until mood == 'e' || mood == 'l' || mood == 'f'
      invalid_response
      prompt_user
      mood = STDIN.gets.chomp.downcase
    end
    if mood == 'e'
      'encouragement'
    elsif mood == 'l'
      'love'
    else
      'funny'
    end
  end

  def greeting_return(name, mood, type)
    #search history for most recent entry
    # what if they check the site and don't make an entry
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


  def post_login
    kind = poem_or_quote
    mood = define_mood
    result = Letter.where(kind: kind, mood: mood).sample
    puts result.content
    get_ratings

    History.create(user_id: @user.id, letter_id: result.id, rating: @rating)

  end

  def greeting_new(name, mood, type)
    "Welcome #{name}! What "
  end

end
