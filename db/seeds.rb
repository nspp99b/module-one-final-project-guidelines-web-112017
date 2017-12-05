u1 = User.create(first_name: "Eric", last_name: "Lum")
u2 = User.create(first_name: "Shahin", last_name: "Motia")
u3 = User.create(first_name: "Joey", last_name: "Joejoe-Shabadoo")

rs1 = Residence.create(address: "50 Broadway", is_primary: true)

pp1 = PollingPlace.create(name: "PS1", address: "22-25 Jackson Ave, Long Island City, NY 11101")
pp2 = PollingPlace.create(name: "Stuy High", address: "345 Chambers St, New York, NY 10282")
pp3 = PollingPlace.create(name: "DMV", address: "211 Greenwich St, New York, NY 10004")
