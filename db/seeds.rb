u1 = User.create(first_name: "Eric", last_name: "Lum")
u2 = User.create(first_name: "Shahin", last_name: "Motia")
u3 = User.create(first_name: "Joey", last_name: "Joejoe-Shabadoo")

pp1 = PollingPlace.create(name: "PS1", address: "22-25 Jackson Ave, Long Island City, NY 11101")
pp2 = PollingPlace.create(name: "Stuy High", address: "345 Chambers St, New York, NY 10282" , council_district: 50041)
pp3 = PollingPlace.create(name: "DMV", address: "211 Greenwich St, New York, NY 10004")

res1 = u1.create_residence(street_number:169, street_name:"Bayard St", zip_code: 11222 ,is_primary:  true)

rv1 = u1.create_review(title: 'werst spot', message: 'holy shit this thing is broken as fuck', wait_time: 120, service: 5)
