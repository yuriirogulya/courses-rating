FactoryBot.define do
  factory :omniauth_params, class: OmniAuth::AuthHash do
    provider 'facebook'
    uid      Faker::Number.number(16)
    info do
      {
        email:      Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name:  Faker::Name.last_name
      }
    end

    initialize_with { attributes }
  end
end