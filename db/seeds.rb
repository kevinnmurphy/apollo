# Add seed data here. Seed your database with `rake db:seed`
admin = User.create(name: "admin", email: "admin@admin.com", password: "admin")
bravo = Team.create(name: "Bravo", description: "brave", users: admin)
chuck = Character.create(name: "Chuck", class: "Fist", ability: "punch", users: bravo)
Equipment.create(name: "Badge", description: "star shaped", characters: chuck)

admin = User.create(name: "admin", email: "admin@admin.com", password: "admin")
charlie = Team.create(name: "Charlie", description: "charred", users: admin)
bronson = Character.create(name: "Bronson", class: "Action", ability: "rap", users: charlie)
Equipment.create(name: "bling", description: "shiny", characters: bronson)

asdf = User.create(name: "asdf", email: "adsf@admin.com", password: "asdf")
alpha = Team.create(name: "Alpha", description: "first", users: admin)
tom = Character.create(name: "tom", class: "actor", ability: "smooth", users: alpha)
Equipment.create(name: "hair", description: "wavy", characters: tom)