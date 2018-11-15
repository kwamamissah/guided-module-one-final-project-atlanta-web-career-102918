# class CLI
#

  def initialize
    @user = nil
    @rating = nil
  end

  def welcome
    hello
    puts ""
    puts ""
    puts ""

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
    pastel = Pastel.new
    puts pastel.red("Please put a valid response.")
  end

  def sign_up
    puts "What's your name"
    name = STDIN.gets.chomp
    puts "What's your email address?"
    email = STDIN.gets.chomp

    until new_email?(email)
      puts "Email already exists.  Please enter a different email"
      email = STDIN.gets.chomp
    end
      @user = User.create(name: name, email: email)
    greeting_new(name)
    post_login

  end

  def new_email?(email)
    search_email(email).nil?

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
    greeting_return(email)

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

  def greeting_return(email)
    #search history for most recent entry
    # what if they check the site and don't make an entry
    # History.where("user_id = ? AND rating > ?", self.id, 3)
    user = User.where(email: email)[0]
    name = user.name
    `say "Welcome back #{name}!"`
    letters = History.where("user_id = ?", user.id)
    most_recent_letter = letters.last.letter_id
    mood = Letter.find(most_recent_letter).mood
    kind = Letter.find(most_recent_letter).kind
    puts "Would you like to see your last #{mood} #{kind} again?"
    `say "Would you like to see your last #{mood} #{kind} again?"`
    prompt_user = puts "Y for Yes or N for No"
    response = STDIN.gets.chomp
    until response.downcase == 'y' || response.downcase == 'n'
      invalid_response
      prompt_user
      response = STDIN.gets.chomp
    end
    if response == "y"
      Letter.find(most_recent_letter).content
    elsif response == "n"
      post_login
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

  def greeting_new(name)

    `say "Welcome #{name}! Truly Unique wants you to have a great day! Would you like a poem or a quote"`


  end


  def hello
    pastel = Pastel.new

    puts ""
    puts ""
    puts ""
     puts pastel.red("
    .___________..______       __    __   __      ____    ____
    |           ||   _  \\     |  |  |  | |  |     \\   \\  /   /
    `---|  |----`|  |_)  |    |  |  |  | |  |      \\   \\/   /
        |  |     |      /     |  |  |  | |  |       \\_    _/
        |  |     |  |\\  \\----.|  `--'  | |  `----.    |  |
        |__|     | _| `._____| \\______/  |_______|    |__|

    __    __  .__   __.  __    ______      __    __   _______      ___
   |  |  |  | |  \\ |  | |  |  /  __  \\    |  |  |  | |   ____|    /  /    _
   |  |  |  | |   \\|  | |  | |  |  |  |   |  |  |  | |  |__      |  |    (_)
   |  |  |  | |  . `  | |  | |  |  |  |   |  |  |  | |   __|     |  |
   |  `--'  | |  |\\   | |  | |  `--'  '--.|  `--'  | |  |____    |  |     _
    \\______/  |__| \\__| |__|  \\_____\\_____\\\\______/  |_______|   |  |    (_)
                                                                  \\__\\
                                                                  ")

      puts     pastel.yellow("start_your_day_on_a_positive_note".center(70))








  end

#
# end
