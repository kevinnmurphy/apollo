# Add seed data here. Seed your database with `rake db:seed`
admin = User.create(name: "admin", email: "admin@admin.com", password: "admin")
bravo = admin.teams.create(name: "Bravo", description: "brave")
chuck = admin.characters.create(name: "Chuck", klass: "Fist", ability: "punch")
TeamCharacter.create(team_id: bravo.id, character_id: chuck.id)
#Equip.create(name: "Badge", description: "star shaped", character: chuck)
Equip.create(name: "Badge", description: "star shaped", character_id: chuck.id)
# Equip.create(name: "Badge", description: "star shaped", ability: "asdf")
# chuck.equips << Equip.first

# charlie = Team.create(name: "Charlie", description: "charred", user: admin)
# bronson = Character.create(name: "Bronson", class: "Action", ability: "rap", user: charlie)
# Equip.create(name: "bling", description: "shiny", character: bronson)

# asdf = User.create(name: "asdf", email: "adsf@admin.com", password: "asdf")
# alpha = Team.create(name: "Alpha", description: "first", user: admin)
# tom = Character.create(name: "tom", class: "actor", ability: "smooth", user: alpha)
# Equip.create(name: "hair", description: "wavy", character: tom)