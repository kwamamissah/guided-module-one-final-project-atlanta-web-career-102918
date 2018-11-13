

jimbo = User.create(name: 'jimbo bob', email:'cantswim@gmail.com')
kamoo = User.create(name:'kamoo', email:'singloud@squarespace.com')
ryan = User.create(name:'RyAn', email:'talktome@gmail.com')

quote = Letter.create(type: 'quote', mood: 'love', title: 'quote1', content: "You're great!")
poem = Letter.create(type: 'poem', mood: 'encouragement', title: 'poem1', content: "I love you.")
joke = Letter.create(type: 'quote', mood: 'joke', title: 'joke1', content: "Haha")

History.create(user_id: jimbo.id, letter_id: quote.id, rating: 5)
History.create(user_id: ryan.id, letter_id: poem.id, rating: 4)
History.create(user_id: kamoo.id, letter_id: joke.id, rating: 1)
