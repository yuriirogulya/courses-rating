class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged finders history]
  acts_as_taggable_on :tags
  ratyrate_rateable 'rating'

  belongs_to :owner, class_name: 'User'
  belongs_to :organization, optional: true
  belongs_to :city
  has_many :reviews
  has_one_attached :logo

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }
  scope :free_courses, -> { where(free: true) }
  scope :rating_order, lambda do
    joins('INNER JOIN rating_caches ON rating_caches.cacheable_id = courses.id')
      .order('rating_caches DESC')
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
