# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
loremipsum = ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc a lobortis urna, at egestas nisi. Aliquam erat volutpat. Pellentesque non ipsum eget ligula convallis aliquam. Fusce mattis vulputate leo, non scelerisque orci imperdiet sed. Donec vel quam a elit mollis sagittis. Sed malesuada eleifend sodales. Proin pharetra lacinia felis vel blandit. Fusce eget blandit nisi, eu gravida ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras vel turpis ornare, vulputate risus id, viverra leo. Cras varius arcu sit amet diam dictum dignissim. Suspendisse quis sem egestas, ultrices lorem et, dapibus mi.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec tellus lacus, placerat vitae velit vel, vehicula posuere neque. Aliquam tristique gravida ultrices. Proin tortor diam, pretium sed tincidunt sed, euismod sed odio. Maecenas auctor vestibulum turpis ut euismod. Aenean vehicula placerat scelerisque. Maecenas sed volutpat purus, non gravida lectus. Donec sagittis in tortor eget dapibus.'

Post.create(subject: 'SEED', main_body: loremipsum, main_image: 'pup1.JPG') 

