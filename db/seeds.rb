# Add seed data here. Seed your database with `rake db:seed`
admin = User.create(name: "admin", email: "admin@admin.com", password: "admin")
bravo = Team.create(name: "Bravo", description: "brave", user: admin)
chuck = Character.create(name: "Chuck", class: "Fist", ability: "punch", user: bravo)
Equipment.create(name: "Badge", description: "star shaped", character: chuck)

admin = User.create(name: "admin", email: "admin@admin.com", password: "admin")
charlie = Team.create(name: "Charlie", description: "charred", user: admin)
bronson = Character.create(name: "Bronson", class: "Action", ability: "rap", user: charlie)
Equipment.create(name: "bling", description: "shiny", character: bronson)

asdf = User.create(name: "asdf", email: "adsf@admin.com", password: "asdf")
alpha = Team.create(name: "Alpha", description: "first", user: admin)
tom = Character.create(name: "tom", class: "actor", ability: "smooth", user: alpha)
Equipment.create(name: "hair", description: "wavy", character: tom)