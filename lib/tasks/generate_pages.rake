include Faker

namespace :generate do
  task :all, [:environment] => [:nav_pages]

  task nav_pages: :environment do
    puts 'Generating navigation pages'
    Page.destroy_all
    titles = %w(Samdhya Ceri Stars Flowers Food)
    content = ''
    titles.each do |title|
      10.times { content += ('<p>' + Lorem.paragraph + '</p>') }
      Page.create!(nav: true, title: title, content: content)
    end
  end
end
