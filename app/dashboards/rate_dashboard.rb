require 'administrate/base_dashboard'

class RateDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    rater: Field::BelongsTo.with_options(class_name: 'User'),
    rateable: Field::Polymorphic,
    id: Field::Number,
    rater_id: Field::Number,
    stars: Field::Number.with_options(decimals: 2),
    dimension: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    rater
    rateable
    stars
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    rater
    rateable
    id
    rater_id
    stars
    dimension
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    rater
    rateable
    rater_id
    stars
    dimension
  ].freeze
end
