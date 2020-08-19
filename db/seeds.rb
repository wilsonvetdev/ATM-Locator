Bank.destroy_all
User.destroy_all 
Userbank.destroy_all
Bank.reset_pk_sequence
User.reset_pk_sequence  
Userbank.reset_pk_sequence

arr_of_arrs = CSV.read("db/banks.csv")
# https://data.ny.gov/Government-Finance/Bank-Owned-ATM-Locations-in-New-York-State/ndex-ad5r

arr_of_arrs.shift

converted_array = []

arr_of_arrs.each do |array|
    converted_array << {:bank_name => array[0], :street_address => array[1], :city => array[2], :zipcode => array[3]}
end

converted_array.first
# returns a hash, can probably use for mass creating with enumerator.
# {:bank_name=>"Abacus Federal Savings Bank", :address=>"5518 8th Avenue", :city=>"Brooklyn", :zipcode=>"11220", :county=>"Kings"}

converted_array.each do |hash|
    Bank.create(hash)
end
# creates bank instances by iterating through each hash inside converted_array.

eric_kim = User.create(user_name: "erickim")
sylwia = User.create(user_name: "sylwia")

Userbank.create(user_id: eric_kim.id, bank_id: Bank.all.sample.id, user_fav: false)
Userbank.create(user_id: eric_kim.id, bank_id: Bank.all.sample.id, user_fav: true)
Userbank.create(user_id: sylwia.id, bank_id: Bank.all.sample.id, user_fav: true)
Userbank.create(user_id: sylwia.id, bank_id: Bank.all.sample.id, user_fav: false)
Userbank.create(user_id: sylwia.id, bank_id: Bank.all.sample.id, user_fav: false)

# to update atm_fee, remember to originate the update from Bank.








# Plant.destroy_all
# Person.destroy_all
# PlantParenthood.destroy_all
# Plant.reset_pk_sequence
# Person.reset_pk_sequence
# PlantParenthood.reset_pk_sequence

########### different ways to write your seeds ############

# 1: save everything to variables (makes it easy to connect models, best for when you want to be intentional about your seeds)
# basil = Plant.create(name: "basil the herb", bought: 20200610, color: "green")
# sylwia = Person.create(name: "Sylwia", free_time: "none", age: 30)
# pp1 = PlantParenthood.create(plant_id: basil.id, person_id: sylwia.id, affection: 1_000_000, favorite?: true)

# 2. Mass create -- in order to connect them later IN SEEDS (not through the app) you'll need to find their id
## a. by passing an array of hashes:

# Plant.create([
#     {name: "Corn Tree", bought: 20170203, color: "green"},
#     {name: "Prayer plant", bought: 20190815, color: "purple"},
#     {name: "Cactus", bought: 20200110, color: "ugly green"}
# ])
# ## b. by interating over an array of hashes:
# plants = [{name: "Elephant bush", bought: 20180908, color: "green"},
#     {name: "Photos", bought: 20170910, color: "green"},
#     {name: "Dragon tree", bought: 20170910, color: "green"},
#     {name: "Snake plant", bought: 20170910, color: "dark green"},
#     {name: "polka dot plant", bought: 20170915, color: "pink and green"},
#     {name: "Cactus", bought: 20200517, color: "green"}]

# plants.each{|hash| Plant.create(hash)}

# # 3. Use Faker and mass create
# ## step 1: write a method that creates a person
# def create_person
#     free = ["mornings", "evenings", "always", "afternoons", "weekends", "none"].sample

#     person = Person.create(
#         name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
#         free_time: free,
#         age: rand(11...70)
#     )
# end

# ## step 2: write a method that creates a joiner
# def create_joiners(person)
#     plants_number = rand(1..4)
#     plants_number.times do 
#         PlantParenthood.create(
#             plant_id: Plant.all.sample.id, 
#             person_id: person.id, 
#             affection: rand(101), 
#             favorite?: [true, false].sample
#         )
#     end
# end

# ## step 3: invoke creating joiners by passing in an instance of a person
# 10.times do     
#     create_joiners(create_person)
#     ##### ALTERNATIVE:
#     # person = create_person
#     # create_joiners(person)
# end

# indoor = Category.create(name: "indoors")

# Plant.update(category_id: indoor.id)

puts "seeds loaded 🔥 🔥 🔥 🔥 "