# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

user = User.create! :email => 'david.m.mandelbaum@gmail.com', :password => 'password', :password_confirmation => 'password'

personal = Section.create({ name: 'Personal', seq_no: 1, guidance: 'Personal information' })
family = Section.create({ name: 'Family', seq_no: 2, guidance: 'Family information' })
background = Section.create({ name: 'Background', seq_no: 3, guidance: 'Background information' })
asylum_application = Section.create({ name: 'Asylum Application', seq_no: 4, guidance: 'Asylum application information' })

I18n.locale = :es
personal.name = "Personal"
family.name = "Familia"
background.name = "Antecedentes"
asylum_application.name = "Solicitud de Asilo"
[personal, family, background, asylum_application].each do |x|
  x.save()
end

personal_p1 = Page.create({ seq_no: 1, name: 'Basic Personal Information', guidance: 'This is for your most basic personal information. Ensure that all names are spelled correctly, and that your last name is filled out in ALL CAPS.' })
personal_p2 = Page.create({ seq_no: 2, name: 'Residence in the U.S.', guidance: 'Where you physically reside' })

question1 = Question.create({ name: 'Alien Registration Number', form_id: 'form1[0].#subform[0].TextField1[0]', explanation: 'A-Number (if any)', seq_no: 1, field_type: 'string' })
question2 = Question.create({ name: 'U.S. Social Security Number', form_id: 'form1[0].#subform[0].TextField1[1]', explanation: '(if any)', seq_no: 2, field_type: 'string' })
question3 = Question.create({ name: 'First Name', form_id: 'form1[0].#subform[0].TextField1[7]', explanation: '', seq_no: 3, field_type: 'string' })
question4 = Question.create({ name: 'Last Name', form_id: 'form1[0].#subform[0].TextField1[2]', explanation: 'Make sure this is complete and in ALL CAPS', seq_no: 5, field_type: 'string' })
question5 = Question.create({ name: 'Middle Name', form_id: 'form1[0].#subform[0].TextField1[8]', explanation: '', seq_no: 4, field_type: 'string' })
question6 = Question.create({ name: 'What other names have you used?', form_id: 'form1[0].#subform[0].TextField1[3]', explanation: 'Include maiden name and aliases', field_type: 'string', seq_no: 6 })
question7a = Question.create({ name: 'Street Number and Name', form_id: 'form1[0].#subform[0].TextField1[4]', explanation: '', field_type: 'string', seq_no: 2 })
question7b = Question.create({ name: 'Apt. Number', form_id: 'form1[0].#subform[0].TextField1[9]', explanation: '', field_type: 'string', seq_no: 3 })
question7c = Question.create({ name: 'City', form_id: 'form1[0].#subform[0].TextField1[5]', explanation: '', field_type: 'string', seq_no: 4 })
question7d = Question.create({ name: 'State', form_id: 'form1[0].#subform[0].TextField1[10]', explanation: '', field_type: 'string', seq_no: 5 })
question7e = Question.create({ name: 'Zip Code', form_id: 'form1[0].#subform[0].TextField1[11]', explanation: '', field_type: 'string', seq_no: 6 })
question7f = Question.create({ name: 'Phone (Area Code)', form_id: 'form1[0].#subform[0].TextField2[0]', explanation: '', field_type: 'string', seq_no: 7 })
question7g = Question.create({ name: 'Phone', form_id: 'form1[0].#subform[0].TextField2[1]', explanation: '', field_type: 'string', seq_no: 7 })

question3.validations = { :"parsley-required" => "", :"parsley-trigger" => "change" }
question4.validations = { :"parsley-required" => "", :"parsley-trigger" => "change" }
question7e.validations = { :"parsley-required" => "", :"parsley-type" => "digits", :"parsley-trigger" => "keydown" }
question7g.validations = { :"parsley-type" => "digits", :"parsley-trigger" => "keydown", :"parsley-validation-threshold" => "1" }

personal_p1.section = personal
personal_p1.save()
personal_p2.section = personal
personal_p2.save()

question1.page = personal_p1
question2.page = personal_p1
question3.page = personal_p1
question4.page = personal_p1
question5.page = personal_p1
question6.page = personal_p1
question7a.page = personal_p2
question7b.page = personal_p2
question7c.page = personal_p2
question7d.page = personal_p2
question7e.page = personal_p2
question7f.page = personal_p2
question7g.page = personal_p2
question1.save()
question2.save()
question3.save()
question4.save()
question5.save()
question6.save()
question7a.save()
question7b.save()
question7c.save()
question7d.save()
question7e.save()
question7f.save()
question7g.save()

family_p1 = Page.create({ seq_no: 1, name: 'Basic Spouse Information', guidance: 'This is for your most basic spousal information. Ensure that all names are spelled correctly, and that last names is filled out in ALL CAPS.' })
family_p2 = Page.create({ seq_no: 2, name: 'Basic Spouse Information 2', guidance: 'Basic spouse information guidance. page 2' })

family_p1.section = family
family_p2.section = family
family_p1.save()
family_p2.save()

fp2q1 = Question.create({ name: 'A-Number', field_type: 'string', seq_no: 1 })
fp2q2 = Question.create({ name: 'Passport/ID Card Number', field_type: 'string', seq_no: 2 })
fp2q3 = Question.create({ name: 'Date of Birth', field_type: 'date', seq_no: 3 })
fp1q1 = Question.create({ name: 'First Name', field_type: 'string', seq_no: 1 })
fp1q2 = Question.create({ name: 'Middle Name', field_type: 'string', seq_no: 2 })
fp1q3 = Question.create({ name: 'Last Name', field_type: 'string', seq_no: 3 })

fp1q1.page = family_p1
fp1q2.page = family_p1
fp1q3.page = family_p1
fp2q1.page = family_p2
fp2q2.page = family_p2
fp2q3.page = family_p2
fp1q1.save()
fp1q2.save()
fp1q3.save()
fp2q1.save()
fp2q2.save()
fp2q3.save()
