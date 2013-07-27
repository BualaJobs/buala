#!/bin/env ruby
# encoding: utf-8
AdminUser.create email: 'admin@bualajobs.com', password: '123123123', password_confirmation: '123123123'

Category.create name: 'Derecho'
Category.create name: 'Agro'
Category.create name: 'Animales'
Category.create name: 'Arquitectura'
Category.create name: 'Arte'
Category.create name: 'Biotecnología y Farmacéutica'
Category.create name: 'Negocios y Finanzas'

CompanyType.create name: 'Empresa'
CompanyType.create name: 'Startup'
CompanyType.create name: 'ONG'

AdvertisementType.create name: 'Internship'
AdvertisementType.create name: 'Part-time 4hs'
AdvertisementType.create name: 'Part-time 5hs'
AdvertisementType.create name: 'Part-time 6hs'