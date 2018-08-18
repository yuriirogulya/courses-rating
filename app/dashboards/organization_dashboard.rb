require 'administrate/base_dashboard'

class OrganizationDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    courses: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    site: Field::String,
    description: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    name
    courses
    site
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    courses
    id
    name
    site
    description
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    courses
    name
    site
    description
  ].freeze

  def display_resource(organization)
    organization.name
  end
end
