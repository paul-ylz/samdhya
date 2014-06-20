require 'test_helper'

class PageTest < ActiveSupport::TestCase
  before do
    @page = Page.new( title: 'Lorem Ipsum',
                      content: 'Content',
                      slug: 'lorem-ipsum')
  end

  it 'should have a title' do
    @page.title = ' '
    refute @page.valid?
  end

  it 'should have a unique title' do
    @page.save!
    dupe = Page.new(title: 'Lorem Ipsum')
    refute dupe.valid?
  end

  it 'creates a slug' do
    @page.slug = ''
    @page.save!
    @page.slug.must_equal 'lorem-ipsum'
  end

  it 'should not allow a slug of "pages"' do
    @page.slug = 'pages'
    refute @page.valid?
  end
end
