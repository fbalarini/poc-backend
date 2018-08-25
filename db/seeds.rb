# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

author = Author.create({name: "Zidane", image:"http://laestrella.com.pa/media/news/image/358845_800x600_crop_59fa3797bb765.jpg"})
author2 = Author.create({name: "Ronaldo", image: "https://cde.peru.com//ima/0/1/7/2/7/1727073/924x530/real-madrid.jpg"})
author3 = Author.create({name: "Carlos", image: "https://vignette.wikia.nocookie.net/terraria/images/0/02/Aliens_Meme.png/revision/latest?cb=20131201074930&path-prefix=es"})
author4 = Author.create({name: "Nestor", image: "https://periodicotribuna.com.ar/aimages/201002/6098-la-salud-de-nestor-kirchner-toda-la-verdad-500x300.jpg"})
author5 = Author.create({name: "Diego", image: "https://www.lavanguardia.com/r/GODO/LV/p5/WebSite/2018/06/26/Recortada/img_aollerm_20180626-231406_imagenes_lv_terceros_meme_maradona_portada-kdMB-U45426913220xzH-992x558@LaVanguardia-Web.jpg"})
author.books.create({name: "El libro de Zidane", content: "asdfsjdfksjdnvksjfjnsdfkjsdnfsdnfjksdnfkasdasdasdasd"})
author2.books.create({name: "El libro de Ronaldo", content: "asdfsjdfksjdnvksjfjnsdfkjsdnfsdnfjksdnfkasdsdasdas"})
author3.books.create({name: "El libro de Carlos", content: "asdfsjdfksjdnvksjfasfsjnsdfkjsdnfsdnfjksdnfkaasdsd"})
author4.books.create({name: "El libro de Nestor", content: "asdfsjdfksjdnvksjfjasdasdnsdfkjsdnfsdnfjksdnfkasd"})
author5.books.create({name: "El libro de Diego", content: "asdfsjdfksjdnvksjfjnasdasdsdfkjsdnfsdnfjksdnfkasd"})
author.books.create({name: "El libro de la magia pura", content: "asdfsjdfksjdnvksjfjnsasdasddfkjsdnfsdnfjksdnfkasd"})