user_count = 0
User.all.each do |user|
  if user.organization == "Faker_Seed"
    user_count += 1
    puts "================= Seed User '##{user_count}' ================="
    puts "Object: #{user}"
    puts "Name: #{user.first_name} #{user.last_name}"
    puts "Email: #{user.email}"

    plan_count = 0
    user.plans.each do |plan|
      plan_count += 1
      puts "  plan #{plan_count}: #{plan.name}"
    end
    user.destroy
    puts  "\n"
    puts "#{user.first_name} #{user.last_name} and plans -- DESTROYED" + "\n\n"
  end
end


# plan and task variables to be used
plan_array = ["Perfect Sales Process", "WikiLogic App", "WikiWit", "Ruby OOP vs. Universe OOP"]

model_seed_hash = {priority_array: [1, 1, 2, 2, 3, 3, 4, 4, 5, 5], state_of_action_array: ["complete", "complete", "not ready", "not ready","complete", "not ready", "not ready","complete", "not ready", "not ready"], minutes_array: [30, 60, 90, 15, 15, 30, 60, 90, 15, 15]}

hethe_person_1 = {person: "Hethe Berg", role: "Programmer"}
person_2 = {person: Faker::Name.name, role: Faker::Name.title}
person_3 = {person: Faker::Name.name, role: Faker::Name.title}
person_array = [hethe_person_1, person_2, person_3]


# 1 seed with the same email and user information
hethe = User.create!(
  first_name: "Hethe",
  last_name: "Berg",
  email: "asdf@asdf.com",
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  organization: 'Faker_Seed',
  admin: true
)

plan_array.each do |plan|
  hethe.plans.create!(name: plan)
end

plan_array.each do |plan|
  hethe_plan_model_seed_hash = model_seed_hash
  position_iterator = 0
  10.times do
    position_iterator += 1
    person_array_local = person_array
    random_person = person_array_local.sample
    hethe.plans.find_by_name(plan).tasks.create!(
        person: random_person[:person],
        role: random_person[:role],
        deed: Faker::Hacker.verb.capitalize + " the " + Faker::Hacker.ingverb + " " + Faker::Hacker.adjective + " " + Faker::Hacker.noun + ".",
        description: Faker::Hacker.say_something_smart + " (Faker::Hacker.say_something_smart)",
        priority: hethe_plan_model_seed_hash[:priority_array].sample,
        position: position_iterator,
        # state_of_action: hethe_plan_model_seed_hash[:state_of_action_array].sample,
        minutes: hethe_plan_model_seed_hash[:minutes_array].sample
      )
  end
end


# 5 random seeds with plans and associated actions
5.times do
  user_first_name = Faker::Name.first_name
  user_last_name = Faker::Name.last_name
  user_email = Faker::Internet.safe_email(user_first_name)

  user = User.create!(
    first_name: user_first_name,
    last_name: user_last_name,
    email: user_email,
    password: 'asdfasdf',
    password_confirmation: 'asdfasdf',
    organization: 'Faker_Seed',
  )

  plan_array.each do |plan|
    user.plans.create!(name: plan)
  end

  plan_array.each do |plan|
    plan_model_seed_hash = model_seed_hash
    position_iterator = 0
    10.times do
      position_iterator += 1
      person_array_local = person_array
      random_person = person_array_local.sample
      user.plans.find_by_name(plan).tasks.create!(
          person: random_person[:person],
          role: random_person[:role],
          deed: Faker::Hacker.verb.capitalize + " the " + Faker::Hacker.ingverb + " " + Faker::Hacker.adjective + " " + Faker::Hacker.noun + ".",
          description: Faker::Hacker.say_something_smart + " (Faker::Hacker.say_something_smart)",
          priority: plan_model_seed_hash[:priority_array].sample,
          position: position_iterator,
          # state_of_action: plan_model_seed_hash[:state_of_action_array].sample,
          minutes: plan_model_seed_hash[:minutes_array].sample
        )
    end
  end
end


user = User.last
user.email = "growthcode@gmail.com"
user.password = "asdfasdf"
user.save
