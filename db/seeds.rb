# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

user = User.create! :email => 'david.m.mandelbaum@gmail.com', :password => 'password', :password_confirmation => 'password'

personal = Section.create({ name: 'Personal', seq_no: 1 })
family = Section.create({ name: 'Family', seq_no: 2 })
background = Section.create({ name: 'Background', seq_no: 3 })
asylum_application = Section.create({ name: 'Asylum Application', seq_no: 4 })

personal_p1 = Page.create({ seq_no: 1, guidance: 'bla' })
personal_p2 = Page.create({ seq_no: 2, guidance: 'bla 2' })

question1 = Question.create({ name: 'Test', form_id: 'form_id', explanation: 'explanation', seq_no: 1, field_type: 'string' })
question2 = Question.create({ name: 'Test 2', form_id: 'form_id2', explanation: 'explanation 2', seq_no: 2, field_type: 'date' })
question3 = Question.create({ name: 'Test 3', form_id: 'form_id3', explanation: 'explanation 3', seq_no: 3, field_type: 'checkbox' })
question4 = Question.create({ name: 'Test 4', form_id: 'form_id4', explanation: 'explanation 4', seq_no: 4, field_type: 'text' })

personal_p1.section = personal
personal_p1.save()
personal_p2.section = personal
personal_p2.save()

question1.page = personal_p1
question2.page = personal_p1
question3.page = personal_p1
question4.page = personal_p1
question1.save()
question2.save()
question3.save()
question4.save()

I18n.locale = :es
question1.name = "Test in Spanish"
question2.name = "Test2 in Spanish"
question1.save()
question2.save()
