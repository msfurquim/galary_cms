# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Catalogues extension
Refinery::Catalogues::Engine.load_seed

# Added by Refinery CMS Current Shows extension
Refinery::CurrentShows::Engine.load_seed

# Added by Refinery CMS Past Shows extension
Refinery::PastShows::Engine.load_seed

# Added by Refinery CMS Artists extension
Refinery::Artists::Engine.load_seed

# Added by Refinery CMS Works extension
Refinery::Works::Engine.load_seed

# Added by Refinery CMS Biographies extension
Refinery::Biographies::Engine.load_seed
