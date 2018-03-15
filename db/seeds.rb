# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' 

    
TypeOfHelp.create([{
    name: "Monetaria"
}])
TypeOfHelp.create([{
    name: "Voluntariado"
}])
TypeOfHelp.create([{
    name: "Regalos"
}])

StatusOfHelp.create([{
    name: "Iniciada"
}])

StatusOfHelp.create([{
    name: "En proceso"
}])

StatusOfHelp.create([{
    name: "Completada"
}])

Interest.create([{
    name: "Salud"
}])

Interest.create([{
    name: "Futbol"
}])

Interest.create([{
    name: "Cocina"
}])

Interest.create([{
    name: "Ciencia"
}])

Interest.create([{
    name: "Salud"
}])

15.times do
    Foundation.create([{
        name: Faker::Name.first_name ,
        direction: Faker::Address.street_address  ,
        latitude: Faker::Address.latitude ,    
        longitude: Faker::Address.longitude,
        interests: Interest.where(id: Faker::Number.between(1, 5)..5)
    }])
    end
    
15.times do
    Admin.create([{
        bio: Faker::Lorem.sentence ,
        name: Faker::Name.first_name ,
        lastname: Faker::Name.last_name ,
        user: Faker::Name.first_name ,
        password: Faker::Internet.password ,    
        email: Faker::Internet.email ,
        phone: Faker::PhoneNumber.phone_number ,
        foundation: Foundation.find(Faker::Number.between(1, 15))
   }])
    end

15.times do
    Contributor.create([{
        description: Faker::Cat.breed ,
        name: Faker::Name.first_name ,
        lastname: Faker::Name.last_name ,
        user: Faker::Name.first_name ,
        password: Faker::Internet.password ,    
        email: Faker::Internet.email ,
        phone: Faker::PhoneNumber.phone_number,
        interests: Interest.where(id: Faker::Number.between(1, 5)..5)
    }])
    end


15.times do
    Benefited.create([{
        name: Faker::Name.first_name ,
        age: Faker::Number.between(4, 18)  ,
        preferences: Faker::Lorem.sentence,   
        foundation: Foundation.find(Faker::Number.between(1, 15)) 
    }])
    end

15.times do
    Event.create([{
        name: Faker::Lorem.word  ,
        startDate: Faker::Date.forward(230) ,
        direction: Faker::Address.street_address  ,
        latitude: Faker::Address.latitude ,    
        longitude: Faker::Address.longitude ,
        description: Faker::Lorem.sentence   ,
        foundation: Foundation.find(Faker::Number.between(1, 15)),
        contributors: Contributor.where(id: Faker::Number.between(1, 12)..Faker::Number.between(12, 16))
    }])
    end

15.times do
    Evidence.create([{
        description: Faker::Lorem.sentence   ,
        event: Event.find(Faker::Number.between(1, 15))
    }])
    end

15.times do
    Help.create([{
        description: Faker::Lorem.sentence,
        startDate: Faker::Date.forward(230),
        status_of_help: StatusOfHelp.find(Faker::Number.between(1, 3)),
        type_of_help: TypeOfHelp.find(Faker::Number.between(1, 3)),
        benefited: Benefited.find(Faker::Number.between(1, 15)),
        contributor: Contributor.find(Faker::Number.between(1, 10))
    }])
    end

15.times do
    Support.create([{
        date: Faker::Date.backward(14),
        help: Help.find(Faker::Number.between(1, 15)),
        description: Faker::Lorem.sentence   
    }])
    end
