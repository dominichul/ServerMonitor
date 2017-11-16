User.create!(email: "dominichul2@live.ca",
             password:              "password",
             password_confirmation: "password",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  email = "example#{n+1}@example.com"
  password = "password"
  User.create!(email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end