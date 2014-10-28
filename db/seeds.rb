# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

personal = Section.create({ name: 'Personal', seq_no: 1 })
family = Section.create({ name: 'Family', seq_no: 2 })
background = Section.create({ name: 'Background', seq_no: 3 })
asylum_application = Section.create({ name: 'Asylum Application', seq_no: 4 })

personal_p1 = Page.create({ seq_no: 1, guidance: 'bla' })

question1 = Question.create({ name: 'Test', field_type: 'Text', form_id: 'form_id', explanation: 'explanation', seq_no: 1 })

personal_p1.section = personal
personal_p1.save()

question1.page = personal_p1
question1.save()
