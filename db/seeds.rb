# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

user = User.create! :email => 'david.m.mandelbaum@gmail.com', :password => 'password', :password_confirmation => 'password', :admin => 1

personal = Section.create({
  name:           'Personal',
  seq_no:         1,
  guidance:       'Personal information'
})

family = Section.create({
  name:           'Family',
  seq_no:         2,
  guidance:       'Family information'
})

background = Section.create({
  name:           'Background',
  seq_no:         3,
  guidance:       'Background information'
})

asylum_application = Section.create({
  name:           'Asylum Application',
  seq_no:         4,
  guidance:       'Asylum application information'
})

I18n.locale = :en

personal_p1 = Page.create({ seq_no: 1,
                            name: 'Basic Personal Information',
                            guidance: 'This is for your most basic personal information. Ensure that all names are spelled correctly, and that your last name is filled out in ALL CAPS.' })

personal_p1.section = personal
personal_p1.save()

personal_p1_questions = []

personal_p1_questions << Question.create({
  name:               'Alien Registration Number',
  form_id:            'form1[0].#subform[0].TextField1[0]',
  explanation:        'A-Number (if any)',
  seq_no:             1,
  field_type:         'string'
})

personal_p1_questions << Question.create({ name: 'U.S. Social Security Number',
                              form_id: 'form1[0].#subform[0].TextField1[1]',
                              explanation: '(if any)',
                              seq_no: 2,
                              field_type: 'string' })

personal_p1_questions << Question.create({ name: 'First Name',
                              form_id: 'form1[0].#subform[0].TextField1[7]',
                              explanation: '',
                              seq_no: 4,
                              field_type: 'string' })

personal_p1_questions << Question.create({ name: 'Last Name',
                              form_id: 'form1[0].#subform[0].TextField1[2]',
                              explanation: 'Make sure this is complete',
                              seq_no: 6,
                              field_type: 'string',
                              validations: { :"allcaps" => "true"} })

personal_p1_questions << Question.create({ name: 'Middle Name',
                              form_id: 'form1[0].#subform[0].TextField1[8]',
                              explanation: '',
                              seq_no: 5,
                              field_type: 'string' })

personal_p1_questions << Question.create({ name: 'What other names have you used?',
                              form_id: 'form1[0].#subform[0].TextField1[3]',
                              explanation: 'Include maiden name and aliases',
                              field_type: 'string',
                              seq_no: 7 })

personal_p1_questions.each do |q|
  q.page = personal_p1
  q.save()
end

# ------------------------------------------------------

personal_p2 = Page.create({ seq_no: 2,
                            name: 'Residence in the U.S.',
                            guidance: 'Where you physically reside' })

personal_p2.section = personal
personal_p2.save()

personal_p2_questions = []

personal_p2_questions << Question.create({ name: 'Street Number and Name',
                               form_id: 'form1[0].#subform[0].TextField1[4]',
                               explanation: '',
                               field_type: 'string',
                               seq_no: 1 })

personal_p2_questions << Question.create({ name: 'Apt. Number',
                               form_id: 'form1[0].#subform[0].TextField1[9]',
                               explanation: '',
                               field_type: 'string',
                               seq_no: 2 })

personal_p2_questions << Question.create({ name: 'City',
                               form_id: 'form1[0].#subform[0].TextField1[5]',
                               explanation: '',
                               field_type: 'string',
                               seq_no: 3 })

personal_p2_questions << Question.create({ name: 'State',
                               form_id: 'form1[0].#subform[0].TextField1[10]',
                               explanation: '',
                               field_type: 'string',
                               seq_no: 4 })

personal_p2_questions << Question.create({ name: 'Zip Code',
                               form_id: 'form1[0].#subform[0].TextField1[11]',
                               explanation: '',
                               field_type: 'string',
                               seq_no: 5 })

personal_p2_questions << Question.create({ name: 'Phone (Area Code)',
                               form_id: 'form1[0].#subform[0].TextField2[0]',
                               explanation: '',
                               field_type: 'string',
                               seq_no: 6,
                               validations: { :"parsley-type" => "digits", :"parsley-trigger" => "keydown" }})

personal_p2_questions << Question.create({ name: 'Phone',
                               form_id: 'form1[0].#subform[0].TextField2[1]',
                               explanation: '',
                               field_type: 'string',
                               seq_no: 7 })

personal_p2_questions.each do |q|
  q.page = personal_p2
  q.save()
end

# ------------------------------------------------------

personal_p3 = Page.create({ seq_no: 3,
                            name: 'Mailing Address in the U.S.' })

personal_p3.section = personal
personal_p3.save()

personal_p3_questions = []

personal_p3_questions << Question.create({
  name:               'In Care Of',
  form_id:            'form1[0].#subform[0].TextField34[0]',
  field_type:         'string',
  seq_no:             1,
})

personal_p3_questions << Question.create({
  name:               'Street Number and Name',
  form_id:            'form1[0].#subform[0].TextField1[13]',
  field_type:         'string',
  seq_no:             2,
})

personal_p3_questions << Question.create({
  name:               'Apt. Number',
  form_id:            'form1[0].#subform[0].TextField1[12]',
  field_type:         'string',
  seq_no:             3,
})

personal_p3_questions << Question.create({
  name:               'City',
  form_id:            'form1[0].#subform[0].TextField1[15]',
  field_type:         'string',
  seq_no:             4,
})

personal_p3_questions << Question.create({
  name:               'State',
  form_id:            'form1[0].#subform[0].TextField1[16]',
  field_type:         'string',
  seq_no:             5,
})

personal_p3_questions << Question.create({
  name:               'Zip',
  form_id:            'form1[0].#subform[0].TextField1[14]',
  field_type:         'string',
  seq_no:             6,
})

personal_p3_questions << Question.create({
  name:               'Area Code',
  form_id:            'form1[0].#subform[0].TextField2[2]',
  field_type:         'string',
  seq_no:             7,
})

personal_p3_questions << Question.create({
  name:               'Phone Number',
  form_id:            'form1[0].#subform[0].TextField2[3]',
  field_type:         'string',
  seq_no:             8,
})

personal_p3_questions.each do |q|
  q.page = personal_p3
  q.save()
end

# ------------------------------------------------------

personal_p4 = Page.create({ seq_no: 4,
                            name: 'Gender and Marital Status' })

personal_p4.section = personal
personal_p4.save()

personal_p4_questions = []

personal_p4_questions << FormText.create({
  title:              'Gender',
  guidance:           'gender guidance here',
  seq_no:             1
})

personal_p4_questions << Question.create({
  name:               'Male',
  form_id:            'form1[0].#subform[0].PartALine9Gender[0]',
  field_type:         'checkbox',
  seq_no:             2,
  checkbox_value:     'M' 
})

personal_p4_questions << Question.create({
  name:               'Female',
  form_id:            'form1[0].#subform[0].PartALine9Gender[1]',
  field_type:         'checkbox',
  seq_no:             3,
  checkbox_value:     'F' 
})

personal_p4_questions << FormText.create({
  title:              'Marital Status',
  guidance:           'marital status guidance here',
  seq_no:             4
})

personal_p4_questions << Question.create({
  name:               'Single',
  form_id:            'form1[0].#subform[0].Marital[0]',
  field_type:         'checkbox',
  seq_no:             5,
  checkbox_value:     'S' 
})

personal_p4_questions << Question.create({
  name:               'Married',
  form_id:            'form1[0].#subform[0].Marital[1]',
  field_type:         'checkbox',
  seq_no:             6,
  checkbox_value:     'M' 
})

personal_p4_questions << Question.create({
  name:               'Divorced',
  form_id:            'form1[0].#subform[0].Marital[2]',
  field_type:         'checkbox',
  seq_no:             7,
  checkbox_value:     'D' 
})

personal_p4_questions.each do |q|
  q.page = personal_p4
  q.save()
end

# ------------------------------------------------------

personal_p5 = Page.create({
  seq_no:             5,
  name:               'Birth information'
})

personal_p5.section = personal
personal_p5.save()

personal_p5_questions = []

personal_p5_questions << Question.create({
  name:               'Date of Birth',
  form_id:            'form1[0].#subform[0].DateTimeField1[0]',
  field_type:         'date',
  seq_no:             1,
})

personal_p5_questions << Question.create({
  name:               'City and Country of Birth',
  form_id:            'form1[0].#subform[0].TextField1[17]',
  field_type:         'string',
  seq_no:             2,
})

personal_p5_questions << Question.create({
  name:               'Present Nationality (citizenship)',
  form_id:            'form1[0].#subform[0].TextField1[6]',
  field_type:         'string',
  seq_no:             3,
})

personal_p5_questions << Question.create({
  name:               'Nationality at Birth',
  form_id:            'form1[0].#subform[0].TextField1[18]',
  field_type:         'string',
  seq_no:             4,
})

personal_p5_questions << Question.create({
  name:               'Race, Ethnic, or Tribal Group',
  form_id:            'form1[0].#subform[0].TextField1[19]',
  field_type:         'string',
  seq_no:             5,
})

personal_p5_questions << Question.create({
  name:               'Religion',
  form_id:            'form1[01.#subform[0].TextField1[20]',
  field_type:         'string',
  seq_no:             6,
})

personal_p5_questions.each do |q|
  q.page = personal_p5
  q.save()
end

# ------------------------------------------------------

personal_p6 = Page.create({
  seq_no:             6,
  name:               'Immigration Court and entrance to U.S.'
})

personal_p6.section = personal
personal_p6.save()

personal_p6_questions = []

personal_p6_questions << FormText.create({
  title:              'Check the box that applies',
  seq_no:             1
})

personal_p6_questions << Question.create({
  name:               'I have never been in Immigration Court proceedings',
  form_id:            'form1[0].#subform[0].CheckBox3[0]',
  field_type:         'checkbox',
  checkbox_value:     'A',
  seq_no:             2,
})

personal_p6_questions << Question.create({
  name:               'I am now in Immigration Court proceedings',
  form_id:            'form1[0].#subform[0].CheckBox3[2]',
  field_type:         'checkbox',
  checkbox_value:     'B',
  seq_no:             3,
})

personal_p6_questions << Question.create({
  name:               'I am not now in Immigration Court proceedings, but I have been in the past',
  form_id:            'form1[0].#subform[0].CheckBox3[1]',
  field_type:         'checkbox',
  checkbox_value:     'C',
  seq_no:             3,
})

personal_p6_questions << Question.create({
  name:               'When did you last leave your country?',
  form_id:            'form1[0].#subform[0].DateTimeField6[0]',
  field_type:         'date',
  seq_no:             4,
})

personal_p6_questions << Question.create({
  name:               'What is your current I-94 Number, if any?',
  form_id:            'form1[0].#subform[0].TextField3[0]',
  field_type:         'string',
  seq_no:             5,
})

personal_p6_questions << FormText.create({
  guidance:           'List each entry into the U.S. beginning with your most recent entry.',
  seq_no:             6,
})

personal_p6_questions << Question.create({
  name:               'Date',
  form_id:            'form1[0].#subform[0].DateTimeField2[0]',
  field_type:         'date',
  seq_no:             7,
})

personal_p6_questions << Question.create({
  name:               'Place',
  form_id:            'form1[0].#subform[0].TextField4[0]',
  field_type:         'string',
  seq_no:             8,
})

personal_p6_questions << Question.create({
  name:               'Status',
  form_id:            'form1[0].#subform[0].TextField4[1]',
  field_type:         'string',
  seq_no:             9,
})

# TODO: insert extra two date/place/status tuples

personal_p6_questions << Question.create({
  name:               'Date Status Expires',
  form_id:            'form1[0].#subform[0].DateTimeField2[1]',
  field_type:         'date',
  seq_no:             10,
})

personal_p6_questions.each do |q|
  q.page = personal_p6
  q.save()
end

# ------------------------------------------------------

family_p1 = Page.create({ seq_no: 1, name: 'Basic Spouse Information', guidance: 'This is for your most basic spousal information. Ensure that all names are spelled correctly, and that last names is filled out in ALL CAPS.' })

family_p1.section = family
family_p1.save()

family_p1_questions = []

family_p1_questions << Question.create({
  name:           'First Name',
  field_type:     'string',
  seq_no:         1,
  explanation:    ''
})

family_p1_questions << Question.create({
  name:           'Middle Name',
  field_type:     'string',
  seq_no:         2,
  explanation:    ''
})

family_p1_questions << Question.create({
  name:           'Last Name',
  field_type:     'string',
  seq_no:         3,
  explanation:    ''
})

family_p1_questions.each do |q|
  q.page = family_p1
  q.save()
end

# ------------------------------------------------------

family_p2 = Page.create({ seq_no: 2, name: 'Basic Spouse Information 2', guidance: 'Basic spouse information guidance. page 2' })

family_p2.section = family
family_p2.save()

family_p2_questions = []

family_p2_questions << Question.create({ 
  name:           'A-Number',
  field_type:     'String',
  seq_no:         1,
  explanation:    ''
})

family_p2_questions << Question.create({
  name:           'Passport/ID Card Number',
  field_type:     'string',
  seq_no:         2,
  explanation:    ''
})

family_p2_questions << Question.create({
  name:           'Date of Birth',
  field_type:     'date',
  seq_no:         3,
  explanation:    '',
  form_id:        'form1[0].#subForm[1].DateTimeField7[0]' 
})

family_p2_questions.each do |q|
  q.page = family_p2
  q.save()
end


# CHECKBOX:


