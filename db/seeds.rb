# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Company.create(id: 1,
              name: "Granicus",
              website: "http://grancius.com",
              headquarters: "Denver, CO",
              products_services: "Computer Software",
              status: "approved",
              size: "51-200",
              industry_id: 1)
Location.create(street_address: "707 17th Street",
                street_address_2: "Suite 4000",
                phone: "720-240-9586",
                status: "approved",
                primary_contact: "Chris Downard",
                company_id: 1,
                zip_code: "80202",
                city: "Denver",
                state: "CO")

Company.create(id: 2,
              name: "SpotX",
              website: "http://www.spotxchange.com",
              headquarters: "Denver, CO",
              products_services: "Software",
              status: "approved",
              size: "201-500",
              industry_id: 2)              )
Location.create(street_address: "11030 CirclePoint Road",
                street_address_2: "Suite 350",
                phone: "303.345.6650",
                status: "approved",
                primary_contact: "Allen Dove, CTIO",
                company_id: 2,
                zip_code: "80020",
                city: "Denver",
                state: "CO")

Company.create(id: 3,
              name: "MondoRobot",
              website: "www.mondorobot.com",
              headquarters: "Boulder, CO",
              products_services: "Digital Strategies, UI & UX Design, Video & Animation, Mobile & Tablet, Applications, Websites, Virtual Reality, Digital Installations, Augmented Reality, Social Experiences, Branding & Identities, Interactive Games",
              status: "approved",
              size: "11-50",
              industry_id: 3)
Location.create(street_address: "5445 Conestoga Court",
                street_address_2: "suite 200",
                phone: "303.800.2916",
                status: "approved",
                primary_contact: "Rebekah Pinter, HR & Talent Manager",
                company_id: 3,
                zip_code: "80301",
                city: "Boulder",
                state: "CO")

Industry.create(id: 1, name: "Computer Software")
Industry.create(id: 2, name: "Internet")
Industry.create(id: 3, name: "Marketing and Advertising")
Industry.create(id: 4, name: "")
Industry.create(id: 5, name: "")
Industry.create(id: 6, name: "")
Industry.create(id: 7, name: "")
Industry.create(id: 8, name: "")
Industry.create(id: 9, name: "")
Industry.create(id: 10, name: "")
Industry.create(id: 11, name: "")
Industry.create(id: 12, name: "")
