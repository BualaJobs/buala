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

itba = University.create name: 'ITBA'
University.create name: 'UCA'
University.create name: 'UCEMA'
University.create name: 'USAL'

Degree.create name: 'Licenciatura En Administración Y Sistemas', university: itba
Degree.create name: 'Ingeniería Industrial', university: itba
Degree.create name: 'Ingeniería Informática', university: itba
Degree.create name: 'Ingeniería Mecánica', university: itba
Degree.create name: 'Ingeniería Electrónica', university: itba
Degree.create name: 'Ingeniería Química', university: itba
Degree.create name: 'Ingeniería en Petróleo', university: itba
Degree.create name: 'Ingeniería Naval', university: itba
Degree.create name: 'Bioingeniería', university: itba
Degree.create name: 'Ingeniería Eléctrica', university: itba