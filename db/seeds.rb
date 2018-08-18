# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(first_name: 'Pavlo',
                    last_name:  'Kasianchuk',
                    role:       'user',
                    email:      'pavlokasianchuk@gmail.com',
                    password:   'pavlopass')

organization = Organization.create!(name:        'Pivorak',
                                    site:        'https://pivorak.com',
                                    description: 'Львівське об’єднання розробників')

title_pivorak  = '#pivorak Ruby Summer Course 2018'
desc_pivorak   = "We at #pivorak believe that knowledge should be shared.\n
This summer we are gathering a group of experienced Ruby developers to teach a
 2-month intensive Ruby & Ruby on Rails course to a class\n
of (almost) complete beginners."
url_pivorak = 'https://pivorak.com/courses/seasons/ruby-2018'

cities = File.read('app/assets/files/cities.yml').split
cities.each do |city|
  City.create(name: city)
end

course_pivorak = Course.create!(title:        title_pivorak,
                                description:  desc_pivorak,
                                url:          url_pivorak,
                                owner:        user,
                                organization: organization,
                                city_id:      1,
                                tag_list:     %w[ruby rails],
                                published:    true,
                                free:         true)

Review.create!(text: 'The best Rugby course', author: user, course: course_pivorak)
