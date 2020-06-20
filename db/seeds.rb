# Add seed data here. Seed your database with `rake db:seed`
admin = User.create(name: "admin", email: "admin@admin.com", password: "admin")
bravo = admin.teams.create(name: "Bravo", description: "brave")
chuck = admin.characters.create(name: "Chuck", klass: "Fist", ability: "punch")
TeamCharacter.create(team_id: bravo.id, character_id: chuck.id)
#Equip.create(name: "Badge", description: "star shaped", character: chuck)
Equip.create(name: "Badge", description: "star shaped", character_id: chuck.id)
# Equip.create(name: "Badge", description: "star shaped", ability: "asdf")
# chuck.equips << Equip.first

user1 = User.create(name: "user1", email: "user1@admin.com", password: "admin")
user2 = User.create(name: "user2", email: "user1@admin.com", password: "admin")
user123 = User.create(name: "123", email: "123@123.com", password: "123")

bravo = admin.teams.create(name: "Bravo", description: "brave")
bravo = admin.teams.create(name: "Bravo", description: "brave")
bravo = admin.teams.create(name: "Bravo", description: "brave")
bravo = admin.teams.create(name: "Bravo", description: "brave")

chuck = admin.characters.create(name: "Chuck", klass: "Fist", ability: "punch")
TeamCharacter.create(team_id: bravo.id, character_id: chuck.id)
barry = admin.characters.create(name: "Barry", klass: "mage", ability: "magic")
TeamCharacter.create(team_id: bravo.id, character_id: barry.id)
tom = admin.characters.create(name: "Tom", klass: "fighter", ability: "strike")
TeamCharacter.create(team_id: bravo.id, character_id: tom.id)
bob = admin.characters.create(name: "bob", klass: "tank", ability: "takes hits")
TeamCharacter.create(team_id: bravo.id, character_id: bob.id)
larry = admin.characters.create(name: "larry", klass: "healer", ability: "heals")
TeamCharacter.create(team_id: bravo.id, character_id: larry.id)
curly = admin.characters.create(name: "curly", klass: "bard", ability: "sings")
TeamCharacter.create(team_id: bravo.id, character_id: curly.id)
mimic = admin.characters.create(name: "mimic", klass: "ditto", ability: "copy")

Equip.create(name: "Badge", description: "Star shaped", character_id: chuck.id)
Equip.create(name: "Cup", description: "Cup shaped", character_id: barry.id)
Equip.create(name: "Fork", description: "Fork shaped", character_id: tom.id)
Equip.create(name: "Spoon", description: "Spoon shaped", character_id: bob.id)
Equip.create(name: "Rope", description: "star shaped", character_id: larry.id)
Equip.create(name: "Shield", description: "Shield shaped", character_id: curly.id)
Equip.create(name: "Ditto", description: "shaped", character_id: chuck.id)
Equip.create(name: "Ditto", description: "shaped", character_id: mimic.id)