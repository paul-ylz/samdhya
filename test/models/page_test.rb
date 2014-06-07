require 'test_helper'

class PageTest < ActiveSupport::TestCase
  before { @page = Page.new(title: 'Lorem Ipsum', content: 'Content') }

  it 'should have a title' do
    @page.title = ' '
    refute @page.valid?
  end

  it 'should have a unique title' do
    @page.save!
    dupe = Page.new(title: 'Lorem Ipsum')
    refute dupe.valid?
  end
end
