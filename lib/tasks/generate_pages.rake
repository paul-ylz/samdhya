include Faker

namespace :generate do
  task :all, [:environment] => [:nav_pages]

  task nav_pages: :environment do
    puts 'Generating navigation pages'
    Page.destroy_all
    titles = %w(Home Services Stars Flowers Food)
    content = ''
    titles.each do |title|
      Lorem.paragraphs(30).each { |para| content += para.gsub(/\A/, '<p>').gsub(/\z/, '</p>')}
      Page.create!(nav: true, title: title, content: content)
    end
  end
end
