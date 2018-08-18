require 'administrate/base_dashboard'

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    courses: Field::HasMany,
    reviews: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    role: Field::String,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    url: Field::String
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    first_name
    last_name
    role
    email
    courses
    reviews
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    courses
    reviews
    id
    first_name
    last_name
    role
    email
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    sign_in_count
    current_sign_in_at
    last_sign_in_at
    current_sign_in_ip
    last_sign_in_ip
    created_at
    updated_at
    url
  ].freeze

  FORM_ATTRIBUTES = %i[
    courses
    reviews
    first_name
    last_name
    role
    email
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    sign_in_count
    current_sign_in_at
    last_sign_in_at
    current_sign_in_ip
    last_sign_in_ip
    url
  ].freeze

  def display_resource(user)
    "#{user.first_name} #{user.last_name}"
  end
end
