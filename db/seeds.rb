User.create(name: "admin", email: "admin@admin.com",  password: "password")

50.times do 
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(8))
end

20.times do 
  Survey.create(user_id: rand(25), title: Faker::Lorem.sentence(5))
end

20.times do |i|  #goes to each survey and creates 5 questions.. (100 questions created)
  i+=1 
  5.times do 
    Question.create(question: Faker::Lorem.sentence(7), survey_id: i)
  end 
end

Question.all.count.times do |i| #goes to each question and adds 4 corresponding answers
  i += 1
  4.times do
    Option.create(option: Faker::Lorem.sentence(4), question_id: i)
  end
end




