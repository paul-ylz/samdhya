include Faker

namespace :generate do
  task :all, [:environment] => [:nav_pages]

  task nav_pages: :environment do
    puts 'Generating navigation pages'
    Page.destroy_all
    titles = %w(Home Services Stars Flowers Food)
    titles.each do |title|
      content = Lorem.paragraphs(3).join('<br /><br />')
      Page.create!(nav: true, title: title, content: content)
    end
  end
end
