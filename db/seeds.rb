# some faker methods for creating sentences
def faker_deed
  Faker::Hacker.verb.capitalize + " the " + Faker::Hacker.ingverb + " " + Faker::Hacker.adjective + " " + Faker::Hacker.noun + "."
end

def faker_resource
  Faker::Hacker::verb.capitalize + " " + Faker::Hacker::noun + " " + Faker::Hacker.ingverb + " to " + Faker::Hacker::noun + ". "
end

def faker_notes
  Faker::Hacker::say_something_smart + ". " + Faker::Hacker::say_something_smart  + ". "
end



# 6 random seeds with plans and associated actions
6.times do
  user_first_name = Faker::Name.first_name

  user = User.create!(
    first_name: user_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email(user_first_name),
    password: 'asdfasdf',
    password_confirmation: 'asdfasdf',
    organization: 'Faker_Seed',
  )

  plan_array = ["Perfect Sales Process", "WikiLogic App", "WikiWit", "Ruby OOP vs. Universe OOP"]

  plan_array.each do |plan|
    user.plans.create!(name: plan)
  end

  plan_array.each do |plan|
    plan_model_seed_hash = {priority_array: [1, 1, 2, 2, 3, 3, 4, 4, 5, 5], state_of_action_array: ["complete", "complete", "not ready", "not ready","complete", "not ready", "not ready","complete", "not ready", "not ready"], minutes_array: [30, 60, 90, 15, 15, 30, 60, 90, 15, 15]}
    position_iterator = 0
    10.times do
      position_iterator += 1
      current_plan = user.plans.find_by_name(plan)
      role = current_plan.roles.create!({
          doer: Faker::Name.title
      })
      current_plan.tasks.create!({
        deed: faker_deed,
        description: Faker::Hacker.say_something_smart,
        priority: plan_model_seed_hash[:priority_array].sample,
        position: position_iterator,
        minutes: plan_model_seed_hash[:minutes_array].sample,
        role_id: role.id,
      })
    end
    user.plans.find_by_name(plan).tasks.each do |task|
      iterator = 0
      10.times do
        task.needs.create!({
          resource: faker_resource,
          notes: faker_notes,
          complete: iterator.odd?,
        })
        iterator += 1
      end
    end
  end
end



# consistent users for development
User.first.update({
  first_name: "Hethe",
  last_name: "Berg",
  email: "asdf@asdf.com",
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  organization: 'Faker_Seed',
  admin: true
})

user_last = User.last.update({
  email: "growthcode@gmail.com",
  password: "asdfasdf"
})
