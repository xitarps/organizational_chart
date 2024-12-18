if Rails.env.development?
  puts '==== cleaning DB ===='
  User.destroy_all
  Company.destroy_all

  puts '==== creating owners data ===='
  a_owner = {level: 0, name: 'A_owner', email: "a0@a.com"}
  b_owner = {level: 0, name: 'B_owner', email: "b0@b.com"}

  puts '==== creating Companies with owners ===='
  a_company = Company.new(name: 'Empresa A', users_attributes: [ a_owner ])
  b_company = Company.new(name: 'Empresa B', users_attributes: [ b_owner ])

  a_company.save
  b_company.save

  puts '==== creating Users data ===='
  a_users = [
    { name: 'a1', email: 'a1@a.com' },
    { name: 'a2', email: 'a2@a.com' },
    { name: 'a3', email: 'a3@a.com' },
    { name: 'a4', email: 'a4@a.com' },
    { name: 'a5', email: 'a5@a.com' },
    { name: 'a6', email: 'a6@a.com' },
    { name: 'a7', email: 'a7@a.com' },
    { name: 'a8', email: 'a8@a.com' },
    { name: 'a9', email: 'a9@a.com' },
    { name: 'a10', email: 'a10@a.com' },
    { name: 'a11', email: 'a11@a.com' },
    { name: 'a12', email: 'a12@a.com' },
    { name: 'a13', email: 'a13@a.com' }
  ]

  b_users = [
    { name: 'b1', email: 'b1@b.com' },
    { name: 'b2', email: 'b2@b.com' },
    { name: 'b3', email: 'b3@b.com' },
    { name: 'b4', email: 'b4@b.com' },
    { name: 'b5', email: 'b5@b.com' },
    { name: 'b6', email: 'b6@b.com' },
    { name: 'b7', email: 'b7@b.com' }
  ]

  puts '==== creating Users to companies ===='
  a_company.users.create(a_users)
  b_company.users.create(b_users)

  puts '==== Seeds end ===='

  company_a = Company.first
  own_a = company_a.users.find_by(level: 0)

  a1 = company_a.users.where(name: 'a1')[0]
  a2 = company_a.users.where(name: 'a2')[0]
  a3 = company_a.users.where(name: 'a3')[0]
  a4 = company_a.users.where(name: 'a4')[0]
  a5 = company_a.users.where(name: 'a5')[0]
  a6 = company_a.users.where(name: 'a6')[0]
  a7 = company_a.users.where(name: 'a7')[0]
  a8 = company_a.users.where(name: 'a8')[0]
  a9 = company_a.users.where(name: 'a9')[0]
  a10 = company_a.users.where(name: 'a10')[0]
  a11 = company_a.users.where(name: 'a11')[0]
  a12 = company_a.users.where(name: 'a12')[0]
  a13 = company_a.users.where(name: 'a13')[0]

  Users::JoinsLeaderService.call(user: a1, leader: own_a)
  
  Users::JoinsLeaderService.call(user: a2, leader: a1)
  Users::JoinsLeaderService.call(user: a3, leader: a1)
  Users::JoinsLeaderService.call(user: a5, leader: a1)

  Users::JoinsLeaderService.call(user: a4, leader: a5)
  Users::JoinsLeaderService.call(user: a6, leader: a5)
  Users::JoinsLeaderService.call(user: a7, leader: a5)

  Users::JoinsLeaderService.call(user: a8, leader: own_a)

  Users::JoinsLeaderService.call(user: a9, leader: a8)
  
  Users::JoinsLeaderService.call(user: a10, leader: a9)
  
  Users::JoinsLeaderService.call(user: a11, leader: a10)
  Users::JoinsLeaderService.call(user: a12, leader: a10)
  Users::JoinsLeaderService.call(user: a13, leader: a10)
else
  puts '=== Not in development enviroment ==='
  puts 'skipping seeds...'
end
