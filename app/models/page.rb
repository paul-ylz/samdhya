class Page < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :slug,  presence: true, uniqueness: true,
                    length: { maximum: 80 },
                    format: { with: /\A([a-z]|\d|-)+\z/ },
                    exclusion: { in: %w(pages) }

  before_validation :create_slug, if: -> (page) { page.slug.blank? }

  def to_param
    slug
  end

  private

  def create_slug
    self.slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end
