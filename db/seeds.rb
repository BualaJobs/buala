#!/bin/env ruby
# encoding: utf-8
AdminUser.create email: 'admin@bualajobs.com', password: 'qwe123qwe123', password_confirmation: 'qwe123qwe123'

Category.create name: 'Derecho'
Category.create name: 'Agro'
Category.create name: 'Cuidado de animales'
Category.create name: 'Arquitectura'
Category.create name: 'Arte'
Category.create name: 'Biotecnología y Farmacéutica'
Category.create name: 'Negocios y Finanzas'
Category.create name: 'Niños y Adolescentes'
Category.create name: 'IT / Software'
Category.create name: 'Servicios Alimenticios'
Category.create name: 'Educación'
Category.create name: 'Ingenieria'
Category.create name: 'Entretenimiento'
Category.create name: 'Medio Ambiente'
Category.create name: 'Eventos'
Category.create name: 'Moda'
Category.create name: 'Gobierno'
Category.create name: 'Diseño Gráfico'
Category.create name: 'Salud'
Category.create name: 'RRHH'
Category.create name: 'IT/Software'
Category.create name: 'Servicios de internet'
Category.create name: 'Legales'
Category.create name: 'Gerencia'
Category.create name: 'Manufactura'
Category.create name: 'nautica'
Category.create name: 'Marketing'
Category.create name: 'Comunicación y Perdiodismo'
Category.create name: 'Administrativo'
Category.create name: 'Politica'
Category.create name: 'Planning de Proyectos'
Category.create name: 'Publicidad'
Category.create name: 'Inmobiliaria'
Category.create name: 'Minorista'
Category.create name: 'Ventas'
Category.create name: 'Ciencia'
Category.create name: 'Deporte'
Category.create name: 'Logística'
Category.create name: 'Turismo'

CompanyType.create name: 'Empresa'
CompanyType.create name: 'Startup'
CompanyType.create name: 'ONG'

AdvertisementType.create name: 'Pasantía'
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

WorkingTurn.create name: 'Turno mañana'
WorkingTurn.create name: 'Turno tarde'
WorkingTurn.create name: 'Turno noche'
WorkingTurn.create name: 'Horario flexible'
