require 'administrate/base_dashboard'

class ReviewDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    course: Field::BelongsTo,
    author: Field::BelongsTo.with_options(class_name: 'User'),
    id: Field::Number,
    text: Field::Text,
    author_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    published: Field::Boolean
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    course
    author
    text
    published
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    course
    author
    id
    text
    author_id
    created_at
    updated_at
    published
  ].freeze

  FORM_ATTRIBUTES = %i[
    course
    author
    text
    author_id
    published
  ].freeze
end
