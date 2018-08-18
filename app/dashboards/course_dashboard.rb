require 'administrate/base_dashboard'

class CourseDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    owner: Field::BelongsTo.with_options(class_name: 'User'),
    organization: Field::BelongsTo,
    city: Field::BelongsTo,
    reviews: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    slug: Field::String,
    published: Field::Boolean,
    owner_id: Field::Number,
    free: Field::Boolean
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    title
    owner
    organization
    city
    reviews
    published
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    owner
    organization
    city
    reviews
    id
    title
    description
    url
    created_at
    updated_at
    slug
    published
    owner_id
    free
  ].freeze

  FORM_ATTRIBUTES = %i[
    owner
    organization
    city
    reviews
    title
    description
    url
    slug
    published
    owner_id
    free
  ].freeze

  def display_resource(course)
    course.title
  end
end
