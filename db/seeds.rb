# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 province1 = Province.create(province_name: 'Antananarivo')
 province2 = Province.create(province_name: 'Antsiranana')
 province3 = Province.create(province_name: 'Fianarantsoa')
 province4 = Province.create(province_name: 'Mahajanga')
 province5 = Province.create(province_name: 'Toliara')
 province6 = Province.create(province_name: 'Toamasina')

niveau1 = Niveau.create(niveau:"1ère année")
niveau2 = Niveau.create(niveau:"2ème année")
niveau3 = Niveau.create(niveau:"3ème année")
niveau4 = Niveau.create(niveau:"4ème année")
niveau5 = Niveau.create(niveau:"5ème année")
niveau5 = Niveau.create(niveau:"Doctorat")

filiere1 = Filiere.create(filiere:"Gestion")
filiere2 = Filiere.create(filiere:"Droit")
filiere3 = Filiere.create(filiere:"Réseau Informatique")
filiere4 = Filiere.create(filiere:"Programmation Informatique")
filiere5 = Filiere.create(filiere:"Multimedia")
filiere6 = Filiere.create(filiere:"Eléctronique")
filiere7 = Filiere.create(filiere:"Télécommunication")
filiere8 = Filiere.create(filiere:"Paramed")
filiere10 = Filiere.create(filiere:"Agronomie")

newsletter1 = Newsletter.create("andry", "haja", "andry@gmail.com")