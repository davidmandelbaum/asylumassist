# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

user = User.create! :email => 'david.m.mandelbaum@gmail.com', :password => 'password', :password_confirmation => 'password', :admin => 1
user = user

personal = Section.create({
  name:           'Personal',
  seq_no:         1,
  guidance:       'The first part of the application requests biographical information about you. This section collects information which may form an important part of your claim. As with every part of the application, you must be careful to answer these questions correctly. Wherever the question asks for information that does not apply to you or for which there is no answer, you must write "not applicable", "N/A", or "none."'
})

family = Section.create({
  name:           'Family',
  seq_no:         2,
  guidance:       'This part of the application asks for information about the applicant’s spouse and children. Most applicants for asylum based on sexual orientation will not be married or have children. For those applicants who are married, the section for the applicant’s spouse must be completed, whether or not the applicant’s spouse is included as part of the this application. If the applicant is not married, check the box on the top line and proceed to the Question 2 which asks about children. If the applicant has no children simply write “none.” The information requested regarding spouse and children is similar to the information requested for the applicant and should be filled out as explained above.'
})

background = Section.create({
  name:           'Background',
  seq_no:         3,
  guidance:       'This section of the application asks for extensive background information, including past residences, education, employment, and family members.<br /><br />Please have ready accurate historical information for these categories, including exact locations and date ranges.'
})

asylum_application = Section.create({
  name:           'Asylum Application',
  seq_no:         4,
  guidance:       'This section of the applications asks for a detailed and specific account of the basis of your claim to asylum.<br /><br />Please have ready as much background information and supporting detail as possible to support your asylum claim. This includes specific dates, places, and descriptions about all events and actions described.'
})

I18n.locale = :en

# --------------------------------------------

personal_p1 = Page.create({ seq_no: 1,
                            name: 'Basic Personal Information',
                            guidance: 'Ensure that all names are spelled correctly.' })

personal_p1.section = personal
personal_p1.save()

personal_p1_questions = []

personal_p1_questions << Question.create({
  name:               'Alien Registration Number',
  form_id:            'form1[0].#subform[0].TextField1[0]',
  explanation:        'The A number is the number assigned to people who have ever filed an application with the INS, CIS, or have had a case in Immigration Court.<br />The A number is an eight or nine digit number. Most applicants applying for asylum will not have an A number at the time the application is filed. If you do not have an A number, the correct answer here is "none."',
  seq_no:             1,
  field_type:         'string'
})

personal_p1_questions << Question.create({ name: 'U.S. Social Security Number',
                              form_id: 'form1[0].#subform[0].TextField1[1]',
                              explanation: 'If you have any valid Social Security number that has ever been issued to you, you must enter it here. If you have an IRS taxpayer I.D. number, do not enter it here.',
                              seq_no: 2,
                              field_type: 'string' })

personal_p1_questions << Question.create({ name: 'First Name',
                              form_id: 'form1[0].#subform[0].TextField1[7]',
                              explanation: '',
                              seq_no: 4,
                              field_type: 'string' })

personal_p1_questions << Question.create({ name: 'Last Name',
                              form_id: 'form1[0].#subform[0].TextField1[2]',
                              explanation: 'List all surnames. Always use your true information even if any identifying documents have been falsified.',
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
                              explanation: 'Include maiden name and aliases. If you are transgender and go by a different name from what is on your identity documents, please put your other name here.',
                              field_type: 'string',
                              seq_no: 7 })

personal_p1_questions.each do |q|
  q.page = personal_p1
  q.save()
end

# ------------------------------------------------------

personal_p2 = Page.create({ seq_no: 2,
                            name: 'Residence in the U.S.',
                            guidance: 'This address determines which Asylum Office has jurisdiction over your application. Therefore, it is important that this information is correct and that the Immigration Service is notified of any changes to this address after the filing of the application.' })

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
                            name: 'Gender and Marital Status',
                            guidance: 'If you are transgender, you should enter the sex that you use to self-identify.<br />If you are in a relationship other than marriage -- such as a civil union or domestic partnership, you should check the box labeled "single."'})

personal_p4.section = personal
personal_p4.save()

personal_p4_questions = []

personal_p4_questions << FormText.create({
  title:              'Gender',
  guidance:           '',
  seq_no:             1
})

personal_p4_questions << Question.create({
  name:               'Male',
  form_id:            'form1[0].#subform[0].PartALine9Gender[0]',
  field_type:         'checkbox',
  seq_no:             2,
  checkbox_value:     'M', 
  validations:        { :"mutex" => [ "p4_3" ] }
})

personal_p4_questions << Question.create({
  name:               'Female',
  form_id:            'form1[0].#subform[0].PartALine9Gender[1]',
  field_type:         'checkbox',
  seq_no:             3,
  checkbox_value:     'F',
  validations:        { :"mutex" => [ "p4_2" ] }
})

personal_p4_questions << FormText.create({
  title:              'Marital Status',
  guidance:           '',
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
  explanation:           'If you hold dual citizenship, include each country of nationality.',
  seq_no:             3,
})

personal_p5_questions << Question.create({
  name:               'Nationality at Birth',
  form_id:            'form1[0].#subform[0].TextField1[18]',
  field_type:         'string',
  explanation:           'Enter this information even if it is the same as present nationality.',
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
  explanation:           'Make sure to mark "none" if you do not have a religious affiliation. Asylum applications are often returned if this box is left blank.',
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
  validations:        { :"mutex" => [ "p6_3", "p6_4" ] }
})

personal_p6_questions << Question.create({
  name:               'I am now in Immigration Court proceedings',
  form_id:            'form1[0].#subform[0].CheckBox3[2]',
  field_type:         'checkbox',
  checkbox_value:     'B',
  seq_no:             3,
  validations:        { :"mutex" => [ "p6_2", "p6_4" ] }
})

personal_p6_questions << Question.create({
  name:               'I am not now in Immigration Court proceedings, but I have been in the past',
  form_id:            'form1[0].#subform[0].CheckBox3[1]',
  field_type:         'checkbox',
  checkbox_value:     'C',
  seq_no:             4,
  validations:        { :"mutex" => [ "p6_2", "p6_3" ] }
})

personal_p6_questions << Question.create({
  name:               'When did you last leave your country?',
  form_id:            'form1[0].#subform[0].DateTimeField6[0]',
  field_type:         'date',
  seq_no:             5,
})

personal_p6_questions << Question.create({
  name:               'What is your current I-94 Number, if any?',
  form_id:            'form1[0].#subform[0].TextField3[0]',
  field_type:         'string',
    explanation:        'The I-94 is the white or green passport-sized Departure Card that a foregn national is given when he/she enters the United States with inspection at an immigration port of entry. The I-94 will have a number of approximately 12 digits in the top left corner which should be entered here. If you entered illegally, you should write "none" in thix box.',
  seq_no:             6,
})

personal_p6_questions << FormText.create({
  guidance:           'List each entry into the U.S. beginning with your most recent entry.',
  seq_no:             7,
})

personal_p6_questions << Question.create({
  name:               'Date',
  form_id:            'form1[0].#subform[0].DateTimeField2[0]',
  field_type:         'date',
  seq_no:             8,
})

personal_p6_questions << Question.create({
  name:               'Place',
  form_id:            'form1[0].#subform[0].TextField4[0]',
  field_type:         'string',
  seq_no:             9,
})

personal_p6_questions << Question.create({
  name:               'Status',
  form_id:            'form1[0].#subform[0].TextField4[1]',
  field_type:         'string',
  seq_no:             10,
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

personal_p7 = Page.create({
  seq_no:             7,
  name:               'Passport information'
})

personal_p7.section = personal
personal_p7.save()

personal_p7_questions = []

personal_p7_questions << Question.create({
  name:               'What country issued your last passport or travel document?',
  form_id:            'form1[0].#subform[0].TextField5[0]',
  field_type:         'string',
  seq_no:             1,
})

personal_p7_questions << Question.create({
  name:               'Passport Number',
  form_id:            'form1[0].#subform[0].TextField5[1]',
  field_type:         'string',
  seq_no:             2,
})

personal_p7_questions << Question.create({
  name:               'Travel Document Number',
  form_id:            'form1[0].#subform[0].TextField5[2]',
  field_type:         'string',
  seq_no:             3,
})

personal_p7_questions << Question.create({
  name:               'Expiration date',
  form_id:            'form1[0].#subform[0].DateTimeField2[2]',
  field_type:         'date',
  seq_no:             4,
})

personal_p7_questions.each do |q|
  q.page = personal_p7
  q.save()
end

# ------------------------------------------------------

personal_p8 = Page.create({
  seq_no:             8,
  name:               'Language information'
})

personal_p8.section = personal
personal_p8.save()

personal_p8_questions = []

personal_p8_questions << Question.create({
  name:               'What is your native language',
  explanation:        'Include dialect, if applicable',
  form_id:            'form1[0].#subform[0].TextField7[0]',
  field_type:         'string',
  seq_no:             1,
})

personal_p8_questions << FormText.create({
  guidance:           'Are you fluent in English?',
  seq_no:             2,
})

personal_p8_questions << Question.create({
  name:               'Yes',
  form_id:            'form1[0].#subform[0].CheckBox4[0]',
  field_type:         'checkbox',
  checkbox_value:     'Yes',
  seq_no:             3,
  validations:        { :"mutex" => [ "p8_4" ] }
})

personal_p8_questions << Question.create({
  name:               'No',
  form_id:            'form1[0].#subform[0].CheckBox4[1]',
  field_type:         'checkbox',
  checkbox_value:     'No',
  seq_no:             4,
  validations:        { :"mutex" => [ "p8_3" ] }
})

personal_p8_questions << Question.create({
  name:               'What other languages do you speak fluently?',
  form_id:            'form1[0].#subform[0].TextField7[1]',
  field_type:         'text',
  seq_no:             5,
})

personal_p8_questions.each do |q|
  q.page = personal_p8
  q.save()
end

# ------------------------------------------------------

family_p1 = Page.create({
  seq_no:             1,
  name:               'Basic Spouse Information',
  guidance:           '',
  validations:        { :"show_dep" => "p3_5" }
})

family_p1.section = family
family_p1.save()

family_p1_questions = []

family_p1_questions << Question.create({
  name:           'Alien Registration Number',
  field_type:     'string',
  seq_no:         1,
  form_id:        'form1[0].#subform[1].TextField10[0]'
})

family_p1_questions << Question.create({
  name:           'Passport/ID Card Number',
  field_type:     'string',
  seq_no:         2,
  form_id:        'form1[0].#subform[1].TextField10[6]'
})

family_p1_questions << Question.create({
  name:           'Date of Birth',
  field_type:     'date',
  seq_no:         3,
  form_id:        'form1[0].#subform[1].DateTimeField7[0]'
})

family_p1_questions << Question.create({
  name:           'U.S. Social Security Number',
  field_type:     'string',
  seq_no:         4,
  form_id:        'form1[0].#subform[1].TextField10[7]'
})

family_p1_questions << Question.create({
  name:           'First Name',
  field_type:     'string',
  seq_no:         5,
  form_id:        'form1[0].#subform[1].TextField10[8]'
})

family_p1_questions << Question.create({
  name:           'Middle Name',
  field_type:     'string',
  seq_no:         6,
  form_id:        'form1[0].#subform[1].TextField10[9]'
})

family_p1_questions << Question.create({
  name:           'Complete Last Name',
  field_type:     'string',
  seq_no:         7,
  form_id:        'form1[0].#subform[1].TextField10[1]'
})

family_p1_questions << Question.create({
  name:           'Maiden Name',
  field_type:     'string',
  seq_no:         8,
  form_id:        'form1[0].#subform[1].TextField10[10]'
})

family_p1_questions.each do |q|
  q.page = family_p1
  q.save()
end

# ------------------------------------------------------

family_p2 = Page.create({
  seq_no:             2,
  name:               'More Spouse Information',
  guidance:           ''
})

family_p2.section = family
family_p2.save()

family_p2_questions = []

family_p2_questions << Question.create({
  name:           'City and Country of Birth',
  field_type:     'string',
  seq_no:         1,
  form_id:        'form1[0].#subForm[1].TextField10[12]'
})

family_p2_questions << Question.create({
  name:           'Nationality',
  field_type:     'string',
  seq_no:         2,
  form_id:        'form1[0].#subForm[1].TextField10[2]'
})

family_p2_questions << Question.create({
  name:           'Race, Ethnic, or Tribal Group',
  field_type:     'string',
  seq_no:         3,
  form_id:        'form1[0].#subForm[1].TextField10[13]'
})

family_p2_questions << FormText.create({
  guidance:       'Gender',
  seq_no:         4
})

family_p2_questions << Question.create({
  name:           'Male',
  field_type:     'checkbox',
  seq_no:         5,
  form_id:        'form1[0].#subForm[1].CheckBox6[0]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p2_6" ] }
})

family_p2_questions << Question.create({
  name:           'Female',
  field_type:     'checkbox',
  seq_no:         6,
  form_id:        'form1[0].#subForm[1].CheckBox6[1]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p2_5" ] }
})

family_p2_questions.each do |q|
  q.page = family_p2
  q.save()
end

# ------------------------------------------------------

family_p3 = Page.create({
  seq_no:             3,
  name:               'Marriage and U.S. Entry',
  guidance:           ''
})

family_p3.section = family
family_p3.save()

family_p3_questions = []

family_p3_questions << Question.create({ 
  name:           'Date of Marriage',
  field_type:     'date',
  seq_no:         1,
  form_id:        'form1[0].#subform[1].DateTimeField8[0]'
})

family_p3_questions << Question.create({
  name:           'Place of Marriage',
  field_type:     'string',
  seq_no:         2,
  form_id:    'form1[0].#subform[1].TextField10[11]'
})

family_p3_questions << FormText.create({
  guidance:       'Is this person in the U.S.?',
  seq_no:         3,
})

family_p3_questions << Question.create({
  name:           'Yes',
  form_id:        'form1[0].#subform[1].CheckBox7[0]',
  field_type:     'checkbox', 
  checkbox_value: '1',
  seq_no:         4,
  validations:    { :"mutex" => [ "p3_5" ] }
})

family_p3_questions << Question.create({
  name:           'No',
  form_id:        'form1[0].#subform[1].CheckBox7[1]',
  field_type:     'checkbox', 
  checkbox_value: '2',
  seq_no:         5,
  validations:    { :"mutex" => [ "p3_4" ] }
})

family_p3_questions << Question.create({
  name:           'Specify location',
  form_id:        'form1[0].#subform[1].TextField10[3]',
  field_type:     'string', 
  seq_no:         6,
  validations:    { :"show_dep" => "p3_5" }
})

family_p3_questions.each do |q|
  q.page = family_p3
  q.save()
end

# ------------------------------------------------------

family_p4 = Page.create({
  seq_no:             4,
  name:               'Spouse U.S. details',
  guidance:           '',
  validations:        { :"show_dep" => "2_p3_4" }
})

family_p4.section = family
family_p4.save()

family_p4_questions = []

family_p4_questions << Question.create({ 
  name:           'Place of last entry into the U.S.',
  field_type:     'string',
  seq_no:         1,
  form_id:        'form1[0].#subform[1].TextField10[4]'
})

family_p4_questions << Question.create({
  name:           'Date of last entry into the U.S.',
  field_type:     'date',
  seq_no:         2,
  form_id:        'form1[0].#subform[1].DateTimeField9[0]'
})

family_p4_questions << Question.create({
  name:           'I-94 Number',
  field_type:     'string',
  seq_no:         3,
  form_id:       'form1[0].#subform[1].TextField10[14]'
})

family_p4_questions << Question.create({
  name:           'Status when last admitted',
  explanation:    'Visa type, if any',
  field_type:     'string',
  seq_no:         4,
  form_id:       'form1[0].#subform[1].TextField10[15]'
})

family_p4_questions << Question.create({
  name:           'What is your spouse\'s current status?',
  field_type:     'string',
  seq_no:         5,
  form_id:       'form1[0].#subform[1].TextField10[5]'
})

family_p4_questions << Question.create({
  name:           'What is the expiration date of his/her authorized stay, if any?',
  field_type:     'string',
  seq_no:         6,
  form_id:       'form1[0].#subform[1].TextField10[0]'
})

family_p4_questions << FormText.create({
  guidance:       'Is your spouse in Immigration Court proceedings?',
  seq_no:         7,
})

family_p4_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         8,
  form_id:       'form1[0].#subform[1].CheckBox8[0]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p4_9" ] }
})

family_p4_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         9,
  form_id:       'form1[0].#subform[1].CheckBox8[1]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p4_8" ] }
})

family_p4_questions << Question.create({
  name:           'If previously in the U.S., date of previous arrival',
  field_type:     'date',
  seq_no:         10,
  form_id:        'form1[0].#subform[1].DateTimeField11[0]'
})

family_p4_questions << FormText.create({
  guidance:       'If in the U.S., is your spouse to be included in this application?',
  seq_no:         11,
})

family_p4_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         12,
  form_id:       'form1[0].#subform[1].CheckBox9[0]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p4_14" ] }
})

family_p4_questions << FormText.create({
  guidance:       'Attach one photograph of your spouse in the upper right corner of Page 9 on the extra copy of the application submitted for this person.',
  seq_no:         13,
  validations:    { :"show_dep" => "p4_12" }
})

family_p4_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         14,
  form_id:       'form1[0].#subform[1].CheckBox9[1]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p4_12" ] }
})

family_p4_questions.each do |q|
  q.page = family_p4
  q.save()
end

# ------------------------------------------------------

# TODO: children checkboxes

family_p5 = Page.create({
  seq_no:             5,
  name:               'Child 1 basic information',
  guidance:           ''
})

family_p5.section = family
family_p5.save()

family_p5_questions = []

family_p5_questions << Question.create({ 
  name:           'Alien Registration Number',
  field_type:     'string',
  seq_no:         1,
  form_id:        'form1[0].#subform[1].TextField12[6]'
})

family_p5_questions << Question.create({
  name:           'Passport/ID Card Number',
  field_type:     'string',
  seq_no:         2,
  form_id:    'form1[0].#subform[1].TextField12[7]'
})

family_p5_questions << Question.create({
  name:           'Marital Status',
  explanation:    'Married, Single, Divorced, Widowed',
  field_type:     'string',
  seq_no:         3,
  form_id:    'form1[0].#subform[1].TextField12[8]'
})

family_p5_questions << Question.create({
  name:           'U.S. Social Security Number',
  explanation:    'if any',
  field_type:     'string',
  seq_no:         4,
  form_id:    'form1[0].#subform[1].TextField12[9]'
})

family_p5_questions << Question.create({
  name:           'First Name',
  field_type:     'string',
  seq_no:         5,
  form_id:    'form1[0].#subform[1].TextField12[2]'
})

family_p5_questions << Question.create({
  name:           'Middle Name',
  field_type:     'string',
  seq_no:         6,
  form_id:    'form1[0].#subform[1].TextField12[3]'
})

family_p5_questions << Question.create({
  name:           'Complete Last Name',
  field_type:     'string',
  seq_no:         7,
  form_id:    'form1[0].#subform[1].TextField12[0]'
})

family_p5_questions.each do |q|
  q.page = family_p5
  q.save()
end

# ------------------------------------------------------

family_p6 = Page.create({
  seq_no:             6,
  name:               'Child 1 birth information',
  guidance:           ''
})

family_p6.section = family
family_p6.save()

family_p6_questions = []

family_p6_questions << Question.create({ 
  name:           'Date of Birth',
  field_type:     'date',
  seq_no:         1,
  form_id:        'form1[0].#subform[1].DateTimeField14[0]'
})

family_p6_questions << Question.create({
  name:           'City and Country of Birth',
  field_type:     'string',
  seq_no:         2,
  form_id:    'form1[0].#subform[1].TextField12[1]'
})

family_p6_questions << Question.create({
  name:           'Nationality (citizenship)',
  field_type:     'string',
  seq_no:         3,
  form_id:    'form1[0].#subform[1].TextField12[8]'
})

family_p6_questions << Question.create({
  name:           'U.S. Social Security Number',
  explanation:    'if any',
  field_type:     'string',
  seq_no:         4,
  form_id:    'form1[0].#subform[1].TextField12[4]'
})

family_p6_questions << Question.create({
  name:           'Race, Ethnic, or Tribal Group',
  field_type:     'string',
  seq_no:         5,
  form_id:    'form1[0].#subform[1].TextField12[5]'
})

family_p6_questions << FormText.create({
  title:          'Gender',
  seq_no:         6
})

family_p6_questions << Question.create({
  name:           'Male',
  field_type:     'checkbox',
  seq_no:         7,
  form_id:    'form1[0].#subform[1].CheckBox16[0]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p6_8" ] }
})

family_p6_questions << Question.create({
  name:           'Female',
  field_type:     'checkbox',
  seq_no:         8,
  form_id:    'form1[0].#subform[1].CheckBox16[1]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p6_7" ] }
})

family_p6_questions.each do |q|
  q.page = family_p6
  q.save()
end

# ------------------------------------------------------

family_p7 = Page.create({
  seq_no:             7,
  name:               'Child 1 U.S. entry information',
  guidance:           ''
})

family_p7.section = family
family_p7.save()

family_p7_questions = []

family_p7_questions << FormText.create({ 
  title:           'Is this child in the U.S.?',
  seq_no:         1,
})

family_p7_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:    'form1[0].#subform[1].CheckBox17[0]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p7_3" ] }
})

family_p7_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:    'form1[0].#subform[1].CheckBox17[1]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p7_2" ] }
})

family_p7_questions << Question.create({
  name:           'Specify Location',
  field_type:     'string',
  seq_no:         4,
  form_id:       'form1[0].#subform[1].TextField10[20]',
  validations:    { :"show_dep" => "p7_3" }
})

family_p7_questions << Question.create({ 
  name:           'Place of last entry into the U.S.',
  field_type:     'string',
  seq_no:         5,
  form_id:        'form1[0].#subform[1].TextField10[16]'
})

family_p7_questions << Question.create({
  name:           'Date of last entry into the U.S.',
  field_type:     'date',
  seq_no:         6,
  form_id:        'form1[0].#subform[1].TextField15[0]'
})

family_p7_questions << Question.create({
  name:           'I-94 Number',
  explanation:    '(if any)',
  field_type:     'string',
  seq_no:         7,
  form_id:       'form1[0].#subform[1].TextField10[17]'
})

family_p7_questions << Question.create({
  name:           'Status when last admitted',
  explanation:    '(Visa type, if any)',
  field_type:     'string',
  seq_no:         8,
  form_id:       'form1[0].#subform[1].TextField10[18]'
})

family_p7_questions.each do |q|
  q.page = family_p7
  q.save()
end

# ------------------------------------------------------

family_p8 = Page.create({
  seq_no:             8,
  name:               'Child 1 Current Status',
  guidance:           ''
})

family_p8.section = family
family_p8.save()

family_p8_questions = []

family_p8_questions << Question.create({
  name:           'What is your child\'s current status?',
  field_type:     'string',
  seq_no:         1,
  form_id:        'form1[0].#subform[1].TextField10[19]',
})

family_p8_questions << Question.create({
  name:           'What is the expiration date of his/her authorized stay, if any?',
  field_type:     'date',
  seq_no:         2,
  form_id:        'form1[0].#subform[1].DateTimeField16[0]'
})

family_p8_questions << FormText.create({
  title:           'Is your child in Immigration Court proceedings?',
  seq_no:         4,
})

family_p8_questions << Question.create({ 
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         5,
  form_id:        'form1[0].#subform[1].CheckBox18[0]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p8_6" ] }
})

family_p8_questions << Question.create({ 
  name:           'No',
  field_type:     'checkbox',
  seq_no:         6,
  form_id:        'form1[0].#subform[1].CheckBox18[1]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p8_5" ] }
})

family_p8_questions << FormText.create({
  title:           'If in the U.S., is this child to be included in this application?',
  seq_no:         7,
})

family_p8_questions << Question.create({ 
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         8,
  form_id:        'form1[0].#subform[1].CheckBox19[0]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p8_10" ] }
})

# TODO: figure out if the spouse reference in the following text is a typo (should be child?)

family_p8_questions << FormText.create({
  guidance:       'Attach one photograph of your spouse in the upper right corner of Page 9 on the extra copy of the application submitted for this person.',
  seq_no:         9,
  validations:    { :"show_dep" => "p8_8" }
})

family_p8_questions << Question.create({ 
  name:           'No',
  field_type:     'checkbox',
  seq_no:         10,
  form_id:        'form1[0].#subform[1].CheckBox19[1]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p8_8" ] }
})

family_p8_questions.each do |q|
  q.page = family_p8
  q.save()
end

# TODO: insert other two children

# ------------------------------------------------------

background_p1 = Page.create({
  seq_no:             1,
  name:               'Last address before coming to the U.S.',
  guidance:           'List your last address where you lived before coming to the United States. If this is not the country where you fear persecution, also list the last address in the country where you fear persecution.'
})

background_p1.section = background
background_p1.save()

background_p1_questions = []

background_p1_questions << Question.create({
  name:           'Number and Street',
  field_type:     'string',
  seq_no:         1,
  form_id:        'form1[0].#subform[1].TextField13[0]',
})

background_p1_questions << Question.create({
  name:           'City/Town',
  field_type:     'string',
  seq_no:         2,
  form_id:        'form1[0].#subform[1].TextField13[2]',
})

background_p1_questions << Question.create({ 
  name:           'Department, Province, or State',
  field_type:     'string',
  seq_no:         3,
  form_id:        'form1[0].#subform[1].TextField13[4]',
})

background_p1_questions << Question.create({ 
  name:           'Country',
  field_type:     'string',
  seq_no:         5,
  form_id:        'form1[0].#subform[1].TextField13[6]',
})

background_p1_questions << Question.create({ 
  name:           'Date From',
  field_type:     'date',
  seq_no:         6,
  form_id:        'form1[0].#subform[1].DateTimeField21[0]',
})

background_p1_questions << Question.create({ 
  name:           'Date To',
  field_type:     'date',
  seq_no:         7,
  form_id:        'form1[0].#subform[1].DateTimeField20[0]',
})

# TODO: format dates without days (data-attributes)?

background_p1_questions.each do |q|
  q.page = background_p1
  q.save()
end

# TODO: add next status line

# ------------------------------------------------------

background_p2 = Page.create({
  seq_no:             2,
  name:               'Residences during the past 5 years',
  guidance:           'Provide the following information about your residences during the past 5 years. List your present address first.'
})

background_p2.section = background
background_p2.save()

background_p2_questions = []

background_p2_questions << Question.create({
  name:           'Number and Street',
  field_type:     'string',
  seq_no:         1,
  form_id:        'form1[0].#subform[1].TextField13[8]',
})

background_p2_questions << Question.create({
  name:           'City/Town',
  field_type:     'string',
  seq_no:         2,
  form_id:        'form1[0].#subform[1].TextField13[10]',
})

background_p2_questions << Question.create({ 
  name:           'Department, Province, or State',
  field_type:     'string',
  seq_no:         3,
  form_id:        'form1[0].#subform[1].TextField13[12]',
})

background_p2_questions << Question.create({ 
  name:           'Country',
  field_type:     'string',
  seq_no:         5,
  form_id:        'form1[0].#subform[1].TextField13[14]',
})

background_p2_questions << Question.create({ 
  name:           'Date From',
  field_type:     'date',
  seq_no:         6,
  form_id:        'form1[0].#subform[1].DateTimeField24[0]',
})

background_p2_questions << Question.create({ 
  name:           'Date To',
  field_type:     'date',
  seq_no:         7,
  form_id:        'form1[0].#subform[1].DateTimeField26[0]',
})

background_p2_questions.each do |q|
  q.page = background_p2
  q.save()
end

# TODO: add next lines

# ------------------------------------------------------

background_p3 = Page.create({
  seq_no:             3,
  name:               'Education',
  guidance:           'Provide the following information about your education, beginning with the most recent.'
})

background_p3.section = background
background_p3.save()

background_p3_questions = []

background_p3_questions << Question.create({
  name:           'Name of School',
  field_type:     'string',
  seq_no:         1,
  form_id:        'form1[0].#subform[1].TextField13[28]',
})

background_p3_questions << Question.create({
  name:           'Type of School',
  field_type:     'string',
  seq_no:         2,
  form_id:        'form1[0].#subform[1].TextField13[30]',
})

background_p3_questions << Question.create({ 
  name:           'Location',
  explanation:    'Address',
  field_type:     'string',
  seq_no:         3,
  form_id:        'form1[0].#subform[1].TextField13[32]',
})

background_p3_questions << Question.create({ 
  name:           'Attended From',
  field_type:     'date',
  seq_no:         4,
  form_id:        'form1[0].#subform[1].DateTimeField24[0]',
})

background_p3_questions << Question.create({ 
  name:           'Attended To',
  field_type:     'date',
  seq_no:         5,
  form_id:        'form1[0].#subform[1].DateTimeField26[0]',
})

background_p3_questions.each do |q|
  q.page = background_p3
  q.save()
end

# TODO: add next few lines

# ------------------------------------------------------

background_p4 = Page.create({
  seq_no:             4,
  name:               'Employment',
  guidance:           'Provide the following information about your employment during the past 5 years. List your present employment first. If you are uncomfortable giving the name of your employer for fear of getting them in trouble, you may provide a vague response, such as "Mexican Restaurant, Brooklyn, NY". Similarly, if you have relatives who are in the United States without lawful status, you may provide a vague current location.'
})

background_p4.section = background
background_p4.save()

background_p4_questions = []

background_p4_questions << Question.create({
  name:           'Name and Address of Employer',
  field_type:     'string',
  seq_no:         1,
  form_id:        'form1[0].#subform[1].TextField13[40]',
})

background_p4_questions << Question.create({
  name:           'Your Occupation',
  field_type:     'string',
  seq_no:         2,
  form_id:        'form1[0].#subform[1].TextField13[42]',
})

background_p4_questions << Question.create({ 
  name:           'Attended From',
  field_type:     'date',
  seq_no:         3,
  form_id:        'form1[0].#subform[1].DateTimeField42[0]'
})

background_p4_questions << Question.create({ 
  name:           'Attended To',
  field_type:     'date',
  seq_no:         4,
  form_id:        'form1[0].#subform[1].DateTimeField44[0]',
})

background_p4_questions.each do |q|
  q.page = background_p4
  q.save()
end

# TODO: add next few lines

# ------------------------------------------------------

background_p5 = Page.create({
  seq_no:             5,
  name:               'Parents and Siblings',
  guidance:           'Provide the following information about your parents and siblings (brothers and sisters). Check the box if the person is deceased.'
})

background_p5.section = background
background_p5.save()

background_p5_questions = []

background_p5_questions << FormText.create({
  title:          'Mother',
  seq_no:         1,
})

background_p5_questions << Question.create({
  name:           'Full Name',
  field_type:     'string',
  seq_no:         1,
  form_id:        'form1[0].#subform[1].TextField13[46]',
})

background_p5_questions << Question.create({
  name:           'City/Town and Country of Birth',
  field_type:     'string',
  seq_no:         2,
  form_id:        'form1[0].#subform[1].TextField13[49]',
})

background_p5_questions << Question.create({ 
  name:           'Deceased',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[1].CheckBoxAIII%\.m[0]',
  checkbox_value: '1'
})

background_p5_questions << Question.create({
  name:           'Current Location',
  field_type:     'string',
  seq_no:         4,
  form_id:        'form1[0].#subform[1].TextField35[0]',
  validations:    { :"hide_dep" => "p5_3" }
})

background_p5_questions << FormText.create({
  title:          'Father',
  seq_no:         5,
})

background_p5_questions << Question.create({
  name:           'Full Name',
  field_type:     'string',
  seq_no:         6,
  form_id:        'form1[0].#subform[1].TextField13[47]',
})

background_p5_questions << Question.create({
  name:           'City/Town and Country of Birth',
  field_type:     'string',
  seq_no:         7,
  form_id:        'form1[0].#subform[1].TextField13[50]',
})

background_p5_questions << Question.create({ 
  name:           'Deceased',
  field_type:     'checkbox',
  seq_no:         8,
  form_id:        'form1[0].#subform[1].CheckBoxAIII5\.f[0]',
  checkbox_value: '1'
})

background_p5_questions << Question.create({
  name:           'Current Location',
  field_type:     'string',
  seq_no:         9,
  form_id:        'form1[0].#subform[1].TextField35[1]',
  validations:    { :"hide_dep" => "p5_8" }
})

# TODO: add siblings

background_p5_questions.each do |q|
  q.page = background_p5
  q.save()
end

# ------------------------------------------------------

asylum_application_p1 = Page.create({
  seq_no:             1,
  name:               'Why are you applying for asylum?',
  guidance:           'Why are you applying for asylum or withholding of removal under section 241(b)(3) of the INA, or for withholding of removal under the Convention Against Torture? Check the appropriate box(es) below and then provide detailed answers to questions A and B below.<br />If you are making a claim based on sexual orientation, transgender identity, and/or HIV status, you should check the box "Membership in a Particular Social Group".'
})

asylum_application_p1.section = asylum_application
asylum_application_p1.save()

asylum_application_p1_questions = []

asylum_application_p1_questions << FormText.create({
  title:          'I am seeking asylum or withholding of removal based on:',
  seq_no:         1,
})

asylum_application_p1_questions << Question.create({
  name:           'Race',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[4].#subform[5].CheckBoxrace[0]',
  checkbox_value: '1'
})

asylum_application_p1_questions << Question.create({
  name:           'Religion',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[4].#subform[5].CheckBoxreligion[0]',
  checkbox_value: '1'
})

asylum_application_p1_questions << Question.create({
  name:           'Nationality',
  field_type:     'checkbox',
  seq_no:         4,
  form_id:        'form1[0].#subform[4].#subform[5].CheckBoxnationality[0]',
  checkbox_value: '1'
})

asylum_application_p1_questions << Question.create({
  name:           'Political opinion',
  field_type:     'checkbox',
  seq_no:         5,
  form_id:        'form1[0].#subform[4].#subform[5].CheckBoxpolitics[0]',
  checkbox_value: '1'
})

asylum_application_p1_questions << Question.create({
  name:           'Membership in a particular social group',
  field_type:     'checkbox',
  seq_no:         6,
  form_id:        'form1[0].#subform[4].#subform[5].CheckBoxsocial[0]',
  checkbox_value: '1'
})

asylum_application_p1_questions << Question.create({
  name:           'Torture Convention',
  field_type:     'checkbox',
  seq_no:         7,
  form_id:        'form1[0].#subform[4].#subform[5].CheckBoxtorture[0]',
  checkbox_value: '1'
})

# TODO: move this to another page

asylum_application_p1_questions << FormText.create({
  guidance:       'Do you also want to apply for withholding of removal under the Convention Against Torture?',
  seq_no:         8
})

asylum_application_p1_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         9,
  form_id:        'form1[0].#subform[0].CheckBox31[0]',
  checkbox_value: '1'
})

asylum_application_p1_questions.each do |q|
  q.page = asylum_application_p1
  q.save()
end

# ------------------------------------------------------

asylum_application_p2 = Page.create({
  seq_no:             2,
  name:               'Harm/mistreatment/threats',
  guidance:           'This question is asking about past persecution. It is important to succinctly state any past harm that either the applicant or anyone whom she knows personally has suffered on account of her sexual orientation, transgender identity or HIV-positive status. If the applicant has never directly experienced harm herself, it is very useful for her to give detailed examples of harm that her family or friends have experienced as this helps personalize her fear of future persecution. Likewise even if the harm she suffered in her country didn’t rise to the level of persecution, it is important (if factually possible) to include some examples of harm here (for example, school taunts, family disownment) to paint a picture of the life that the applicant is afraid to return to.
  
  It is best to be succinct and specific in answering this question because the Asylum Officer will probably follow along with the answers to the “essay” questions during the interview.'
})

asylum_application_p2.section = asylum_application
asylum_application_p2.save()

asylum_application_p2_questions = []

asylum_application_p2_questions << FormText.create({
  guidance:          'Have you, your family, or close friends or colleagues ever experienced harm or mistreatment or threats in the past by anyone?',
  seq_no:         1,
})

asylum_application_p2_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[4].#subform[5].ckboxyn1a[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p2_3" ] }
})

asylum_application_p2_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[4].#subform[5].ckboxyn1a[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p2_2" ] }
})

asylum_application_p2_questions << FormText.create({
  guidance:       'Explain in detail: <br />1. What happened;<br />2. When the harm or mistreatment or threats occurred;<br />Who caused the harm or mistreatment or threats; and<br />4. Why you believe the harm or mistreatment or threats occurred.',
  seq_no:         4,
  validations:    { :"show_dep" => "p2_3" }
})

asylum_application_p2_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         5,
  form_id:        'form1[0].#subform[4].#subform[5].TextField14[0]',
  validations:    { :"show_dep" => "p2_3" },
  translate:      true
})

asylum_application_p2_questions.each do |q|
  q.page = asylum_application_p2
  q.save()
end

# ------------------------------------------------------

asylum_application_p3 = Page.create({
  seq_no:             3,
  name:               'Fear upon return',
  guidance:           'This question essentially asks whether the applicant fears future persecution. For the applicant to qualify for asylum the answer to this question must be “yes.” Again, it is helpful to be both succinct and specific in detailing the type of harm feared – abuse by police, gay bashings, coercive psychological “treatment,” forced marriage, disownment by family, lack of medical treatment, inability to find any employment, etc.
  
  The answer to this question is especially important if the applicant did not experience past persecution. You should explain specifically how the applicant became fearful of the consequences of being LGBT/H especially if he had no personal experience with such persecution. In some cases, the applicant may have become aware of the persecution of other sexual minorities because of incidents in which friends or acquaintances had been victims of persecution, or when such incidents happened to strangers and were reported in the media or documented in other sources. Again the applicant should be as specific as possible about how he learned of the harm that occurred to others.'
})

asylum_application_p3.section = asylum_application
asylum_application_p3.save()

asylum_application_p3_questions = []

asylum_application_p3_questions << FormText.create({
  guidance:       'Do you fear harm or mistreatment if you return to your home country?',
  seq_no:         1,
})

asylum_application_p3_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[4].#subform[5].ckboxyn1b[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p3_3" ] }
})

asylum_application_p3_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[4].#subform[5].ckboxyn1b[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p3_2" ] }
})

asylum_application_p3_questions << FormText.create({
  guidance:       'Explain in detail: <br />1. What harm or mistreatment you fear;<br />2. Who you believe would harm or mistreat you; and<br />3. Why you believe you would or could be harmed or mistreated.',
  seq_no:         4,
  validations:    { :"show_dep" => "p3_3" }
})

asylum_application_p3_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         5,
  form_id:        'form1[0].#subform[4].#subform[5].TextField15[0]',
  validations:    { :"show_dep" => "p3_3" },
  translate:      true
})

asylum_application_p3_questions.each do |q|
  q.page = asylum_application_p3
  q.save()
end

# ------------------------------------------------------

asylum_application_p4 = Page.create({
  seq_no:             4,
  name:               'Arrests, interrogations, etc.',
  guidance:           'You may have already included information about arrests or detentions the applicant suffered in his country in your answers to a previous question, but you should still list such incidents again in answer to this question. Remember, this question doesn’t only ask about convictions, but includes arrests, detentions, and interrogations. Thus any interaction the applicant had with the police or military in which he did not feel free to leave should be included here.
  
  Answering this question can help provide details about the basis of the applicant’s claim, if, for example, he was detained and abused by the police because of his sexual orientation. In some sexual orientation based cases, applicants have been previously arrested, charged and convicted of violating laws prohibiting homosexuality or homosexual sexual conduct. These “prosecutions” for private sexual activity between consenting adults may in fact be persecution.
                                                                                               
                                                                                               It is also important to include any information about arrests or detentions even if they are unrelated to the asylum claim itself. Convictions for some crimes could lead to a bar to asylum so the Officer will pay close attention to the answers to this section. See Section # 6.2.'
})

asylum_application_p4.section = asylum_application
asylum_application_p4.save()

asylum_application_p4_questions = []

asylum_application_p4_questions << FormText.create({
  guidance:           'Have you or your family members ever been accused, charged, arrested, detained, interrogated, convicted and sentenced, or imprisoned in any country other than the United States?',
  seq_no:         1,
})

asylum_application_p4_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[6].ckboxyn2[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => ["p4_3"] }
})

asylum_application_p4_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[6].ckboxyn2[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => ["p4_2"] }
})

asylum_application_p4_questions << FormText.create({
  guidance:       'Explain the circumstances and reasons for the action.',
  seq_no:         4,
  validations:    { :"show_dep" => "p4_3" }
})

asylum_application_p4_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         5,
  form_id:        'form1[0].#subform[6].TextField16[0]',
  validations:    { :"show_dep" => "p4_3" },
  translate:      true
})

asylum_application_p4_questions.each do |q|
  q.page = asylum_application_p4
  q.save()
end

# ------------------------------------------------------

asylum_application_p5 = Page.create({
  seq_no:             5,
  name:               'Associations with organizations or groups',
  guidance:           'This question is usually most relevant to someone who is claiming persecution based on her political opinion or affiliation with a certain political organization. In the case of sexual-orientation based claims, if the applicant was a member of an LGBT/H organization and for that reason was targeted for persecution then the applicant may have a dual claim based on LGBT/H status and political opinion. The applicant should list any or all associations or memberships with LGBT/H organizations in her home country along with corroborating evidence of such membership such as letters, membership cards, news stories, etc.
  
  Even if the applicant herself was not affiliated with any organizations in her country, she may fear returning because of her family’s affiliations. For example, a Colombian applicant with a politically active brother may fear returning to her country based on her own imputed political opinion because of her brother’s activities. It is therefore important to answer this question thoroughly regarding the entire family.
  
  The answer to this question could also trigger mandatory bars to asylum if the applicant was affiliated with an organization with the United States considers to be a terrorist or genocidal organization.'
})

asylum_application_p5.section = asylum_application
asylum_application_p5.save()

asylum_application_p5_questions = []

asylum_application_p5_questions << FormText.create({
  guidance:           'Have you or your family members ever belonged to or been associated with any organizations or groups in your home country, such as, but not limited to, a political party, student group, labor union, religious organization, military or paramilitary group, civil patrol, guerrilla organization, ethnic group, human rights group, or the press or media?',
  seq_no:         1,
})

asylum_application_p5_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[6].ckboxyn3a[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p5_3" ] }
})

asylum_application_p5_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[6].ckboxyn3a[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p5_2" ] }
})

asylum_application_p5_questions << FormText.create({
  guidance:       'Describe for each person the level of participation, any leadership or other positions held, and the length of time you or your family members were involved in each organization or activity.',
  seq_no:         4,
  validations:    { :"show_dep" => "p5_3" },
})

asylum_application_p5_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         5,
  form_id:        'form1[0].#subform[6].TextField16[1]',
  validations:    { :"show_dep" => "p5_3" },
  translate:      true
})

asylum_application_p5_questions.each do |q|
  q.page = asylum_application_p5
  q.save()
end

# ------------------------------------------------------

asylum_application_p6 = Page.create({
  seq_no:             6,
  name:               'Continued participation',
  guidance:           'The answer to this question could impact the your fear of future persecution, so if you are still involved in any of these groups, you should explain your involvement thoroughly.'
})

asylum_application_p6.section = asylum_application
asylum_application_p6.save()

asylum_application_p6_questions = []

asylum_application_p6_questions << FormText.create({
  guidance:           'Do you or your family members continue to participate in any way in these organizations or groups?',
  seq_no:         1,
})

asylum_application_p6_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[6].ckboxyn3b[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p6_3" ] }
})

asylum_application_p6_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[6].ckboxyn3b[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p6_2" ] }
})

asylum_application_p6_questions << FormText.create({
  guidance:       'Describe for each person your or your family members\' current level of participation, any leadership or other positions currently held, and the length of time you or your family members have been involved in each organization or group.',
  seq_no:         4,
  validations:    { :"show_dep" => "p6_3" }
})

asylum_application_p6_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         5,
  form_id:        'form1[0].#subform[6].TextField16[2]',
  validations:    { :"show_dep" => "p6_3" },
  translate:      true
})

asylum_application_p6_questions.each do |q|
  q.page = asylum_application_p6
  q.save()
end

# ------------------------------------------------------

asylum_application_p7 = Page.create({
  seq_no:             7,
  name:               'Afraid of torture?',
  guidance:           'If the applicant is applying for relief under the Convention against Torture, she should be able to answer truthfully “yes” to this question. See Section # 7 for more information about CAT relief. Basically, if the applicant fears physical harm or pain either directly at the hands of her government or with the acquiescence of her government, she should respond that she fears torture in her country. Again, although the answer to this question may be redundant with answers to other questions, you should still include succinct but detailed information about why the applicant fears torture and by whom.'
})

asylum_application_p7.section = asylum_application
asylum_application_p7.save()

asylum_application_p7_questions = []

asylum_application_p7_questions << FormText.create({
  guidance:           'Are you afraid of being subjected to torture in your home country or any other country to which you may be returned?',
  seq_no:         1,
})

asylum_application_p7_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[6].ckboxyn4[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p7_3" ] }
})

asylum_application_p7_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[6].ckboxyn4[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p7_2" ] }
})

asylum_application_p7_questions << FormText.create({
  guidance:       'If "Yes," explain why you are afraid and describe the nature of torture you fear, by whom, and why it would be inflicted.',
  seq_no:         4,
  validations:    { :"show_dep" => "p7_3" }
})

asylum_application_p7_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         5,
  form_id:        'form1[0].#subform[6].TextField16[4]',
  validations:    { :"show_dep" => "p7_3" },
  translate:      true
})

asylum_application_p7_questions.each do |q|
  q.page = asylum_application_p7
  q.save()
end

# ------------------------------------------------------

asylum_application_p8 = Page.create({
  seq_no:             8,
  name:               'Past applications?',
  guidance:           'The response to the question of whether an applicant has previously applied for asylum or withholding of removal may be extremely important in the adjudication of this application. If the applicant has never before filed such an application, then the obvious correct answer is simply to check the "no" box.
  
  In some cases, an applicant is filing an application because he has been previously included in an application by a parent, but no longer qualifies as an unmarried child under twenty-one and must now file a separate application.
  
  In other cases, however, the applicant has previously filed an application (yes). This application may still be pending with the Immigration Service or may have been denied administratively (denial by the Asylum Office.) In either case, a subsequent application for asylum must fully explain the circumstances surrounding the previous application and the disposition or status of the previous application. This explanation may be incorporated in the applicant’s affidavit, particularly if it is a lengthy explanation and if it helps explain other parts of the case such as the applicant’s fear of return to his country.
  
  It is worth noting here that some individuals with true LGBT/H based asylum claims may previously have had weak, frivolous or fraudulent asylum applications filed on their behalf on other grounds. These previous applications may have been filed by an attorney or non-attorney (such as a “notario”) in order to obtain employment authorization for the applicant without fully explaining the nature of the documents being filed. It is, therefore, vital that an applicant fully explain the reasoning behind the previous application.'
})

asylum_application_p8.section = asylum_application
asylum_application_p8.save()

asylum_application_p8_questions = []

asylum_application_p8_questions << FormText.create({
  guidance:           'Have you, your spouse, your child(ren), your parents or your siblings ever applied to the U.S. Government for refugee status, asylum, or withholding of removal?',
  seq_no:         1,
})

asylum_application_p8_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[7].ckboxync1[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p8_3" ] }
})

asylum_application_p8_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[7].ckboxync1[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p8_2" ] }
})

asylum_application_p8_questions << FormText.create({
  guidance:       'Explain the decision and what happened to any status you, your spouse, your child(ren), your parents, or your siblings received as a result of that decision. Indicate whether or not you were included in a parent or spouse\'s application. If so, include your parent or spouse\'s A-number in your response. If you have been denied asylum by an immigration judge or the Board of Immigration Appeals, describe any change(s) in conditions in your country or your own personal circumstances since the date of the denial that may affect your eligibility for asylum.',
  seq_no:         4,
  validations:    { :"show_dep" => "p8_3" }
})

asylum_application_p8_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         5,
  form_id:        'form1[0].#subform[7].TextField17[0]',
  validations:    { :"show_dep" => "p8_3" },
  translate:      true
})

asylum_application_p8_questions.each do |q|
  q.page = asylum_application_p8
  q.save()
end

# ------------------------------------------------------

asylum_application_p9 = Page.create({
  seq_no:             9,
  name:               'Other countries',
  guidance:           'The purpose of these questions is to determine whether the applicant could have sought or could currently seek asylum or other lawful immigration status in a country other than the United States. Asylum is meant to be an application of last resort; if the applicant had or has a reasonable opportunity to safely relocate elsewhere, that is a ground for the United States to deny the asylum application.
  
  Note that question 2. A. inquires both as to whether the applicant resided in another country and as to whether the applicant traveled through another country. If the applicant traveled briefly through another country (for example a Guatemalan traveled overland across Mexico), it is unlikely that the Asylum Officer would question why he did not seek asylum there. If, however, the applicant traveled through another country which grants asylum to LGBT/H individuals, he should be prepared to explain why he did not seek asylum in that country. Likewise, if an applicant actually resided in another country before fleeing to the United States, he should explain why he did not seek asylum there. For example, if an Egyptian lived in Qatar before coming to the United States and applying for asylum, he could explain that sexual minorities are mistreated in Qatar as well.'
})

asylum_application_p9.section = asylum_application
asylum_application_p9.save()

asylum_application_p9_questions = []

asylum_application_p9_questions << FormText.create({
  guidance:           'After leaving the country from which you are claiming asylum, did you or your spouse or child(ren) who are now in the United States travel through or reside in any other country before entering the United States?',
  seq_no:         1,
})

asylum_application_p9_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[7].ckboxync2a[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p9_3" ] }
})

asylum_application_p9_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[7].ckboxync2a[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p9_2" ] }
})

asylum_application_p9_questions << FormText.create({
  guidance:           'Have you, your spouse, your child(ren), or other family members, such as your parents or siblings, ever applied for or received any lawful status in any country other than the one from which you are now claiming asylum?',
  seq_no:         4,
})

asylum_application_p9_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         5,
  form_id:        'form1[0].#subform[6].ckboxync2b[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p9_6" ] }
})

asylum_application_p9_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         6,
  form_id:        'form1[0].#subform[6].ckboxync2b[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p9_5" ] }
})

# TODO: only show following box if Yes is checked on either question

asylum_application_p9_questions << FormText.create({
  guidance:       'If "Yes" to either or both questions (2A and/or 2B), provide for each person the following: the name of each country and the length of stay, the person\'s status while there, the reasons for leaving, whether or not the person is entitled to return for lawful residence purposes, and whether the person applied for refugee status or for asylum while there, and if not, why he or she did not do so.',
  seq_no:         7,
  validations:    { :"show_dep" => [ "p9_6", "p9_3" ] }
})

asylum_application_p9_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         8,
  form_id:        'form1[0].#subform[7].TextField18[0]',
  validations:    { :"show_dep" => [ "p9_6", "p9_3" ] },
  translate:      true
})

asylum_application_p9_questions.each do |q|
  q.page = asylum_application_p9
  q.save()
end

# ------------------------------------------------------

asylum_application_p10 = Page.create({
  seq_no:             10,
  name:               'Participated in causing harm?',
  guidance:           'This question again addresses mandatory bars to asylum. In the vast majority of cases, the answer to this question will be “no.” If the applicant did participate in persecuting others, for example, during mandatory military service or forced guerilla service, he should explain in detail why he was forced to carry out the actions which he did.'
})

asylum_application_p10.section = asylum_application
asylum_application_p10.save()

asylum_application_p10_questions = []

asylum_application_p10_questions << FormText.create({
  guidance:           'Have you, your spouse or your child(ren) ever ordered, incited, assisted or otherwise participated in causing harm or suffering to any person because of his or her race, religion, nationality, membership in a particular social group or belief in a particular political opinion?',
  seq_no:         1,
})

asylum_application_p10_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[7].ckboxync3[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p10_3" ] }
})

asylum_application_p10_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[7].ckboxync3[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p10_2" ] }
})

asylum_application_p10_questions << FormText.create({
  guidance:       'Describe in detail each such incident and your own, your spouse\'s, or your child(ren)\'s involvement',
  seq_no:         4,
  validations:    { :"show_dep" => "p10_3" }
})

asylum_application_p10_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         5,
  form_id:        'form1[0].#subform[7].TextField18[1]',
  validations:    { :"show_dep" => "p10_3" },
  translate:      true
})

asylum_application_p10_questions.each do |q|
  q.page = asylum_application_p10
  q.save()
end

# ------------------------------------------------------

asylum_application_p11 = Page.create({
  seq_no:             11,
  name:               'Return to country where harmed?',
  guidance:           'There are many situations which might lead to an asylum applicant returning to her home country after having left it. Because many LGBT/H asylum applicants don’t know that their sexual minority or HIV status can be the basis of an asylum claim, many individuals return to their countries to comply with the terms of their visas. Some applicants make regular trips to and from the United States to receive HIV medical treatment here. Other applicants, such as students, may not have experienced persecution in their countries until they’ve had the chance to live in the United States and “come out.”
  
  The applicant must anticipate that the Asylum Officer will question why she is afraid to return to her country now if she willingly returned in the past. She should address this anticipated question in this answer on the form.'
})

asylum_application_p11.section = asylum_application
asylum_application_p11.save()

asylum_application_p11_questions = []

asylum_application_p11_questions << FormText.create({
  guidance:           'After you left the country where you were harmed or fear harm, did you return to that country?',
  seq_no:         1,
})

asylum_application_p11_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[8].ckboxync1a[3]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p11_3" ] }
})

asylum_application_p11_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[8].ckboxync1a[2]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p11_2" ] }
})

asylum_application_p11_questions << FormText.create({
  guidance:       'Describe in detail the circumstances of your visit(s) (for example, the date(s) of the trip(s), the purpose(s) of the trip(s), and the length of time you remained in that country for the visit(s).',
  seq_no:         4,
  validations:    { :"show_dep" => "p11_3" }
})

asylum_application_p11_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         5,
  form_id:        'form1[0].#subform[8].TextField19[0]',
  validations:    { :"show_dep" => "p11_3" },
  translate:      true
})

asylum_application_p11_questions.each do |q|
  q.page = asylum_application_p11
  q.save()
end

# ------------------------------------------------------

asylum_application_p12 = Page.create({
  seq_no:             12,
  name:               'Filing deadline',
  guidance:           'If the answer to this question is “yes,” you should explain in detail why the applicant did not file within the one year filing deadline. Missing the deadline means the asylum application will be denied unless the applicant can demonstrate an exception to the one year filing deadline. It is important to state succinctly but with some detail the applicant’s claimed exception to the one year filing deadline in this section. The two categories of filing deadline exceptions are for “changed circumstances” and/or “extraordinary circumstances.” If the applicant has missed the one year filing deadline, please See Section # 5 for a detailed discussion of the one year filing deadline and possible exceptions. It is also important to understand that even if the applicant meets an exception to the one year deadline, he must file “within a reasonable period of time” after the exception. The answer to this question should therefore also briefly address the reasonableness of the period of time.
  
  In general, an applicant should not file for asylum affirmatively if he or she has missed the one year filing deadline, unless he or she has a strong argument for a filing deadline exception.'
})

asylum_application_p12.section = asylum_application
asylum_application_p12.save()

asylum_application_p12_questions = []

asylum_application_p12_questions << FormText.create({
  guidance:           'Are you filing this application more than 1 year after your last arrival in the United States?',
  seq_no:         1,
})

asylum_application_p12_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[8].ckboxync5[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p12_3" ] }
})

asylum_application_p12_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[8].ckboxync5[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p12_2" ] }
})

asylum_application_p12_questions << FormText.create({
  guidance:       'Explain why you did not file within the first year after you arrived. You must be prepared to explain at your interview or hearing why you did not file your asylum application within the first year after you arrived. For guidance in answering this question, see Instructions, Part I: Filing Instructions, Section V. "Completing the Form", Part C',
  seq_no:         4,
  validations:    { :"show_dep" => "p12_3" }
})

asylum_application_p12_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         5,
  form_id:        'form1[0].#subform[8].TextField19[1]',
  validations:    { :"show_dep" => "p12_3" },
  translate:      true
})

asylum_application_p12_questions.each do |q|
  q.page = asylum_application_p12
  q.save()
end

# ------------------------------------------------------

asylum_application_p13 = Page.create({
  seq_no:             13,
  name:               'Crimes committed',
  guidance:           'It is very important that the applicant answer this question truthfully. The applicant must answer “yes” if she was ever arrested, even if she was never charged or convicted. Thus, even if a criminal case was dismissed and sealed, the applicant must answer “yes.”
  
  If an applicant was convicted of a “particularly serious crime” she will not eligible for asylum or withholding of removal. If you are not certain whether a crime that the applicant committed would affect her asylum eligibility, research this issue thoroughly before filing the application. For more information on criminal bars to asylum eligibility see Section # 6.2.'
})

asylum_application_p13.section = asylum_application
asylum_application_p13.save()

asylum_application_p13_questions = []

asylum_application_p13_questions << FormText.create({
  guidance:           'Have you or any member of your family included in the application ever committed any crime and/or been arrested, charged, convicted, or sentenced for any crimes in the United States?',
  seq_no:         1,
})

asylum_application_p13_questions << Question.create({
  name:           'No',
  field_type:     'checkbox',
  seq_no:         2,
  form_id:        'form1[0].#subform[8].ckboxync6[1]',
  checkbox_value: '1',
  validations:    { :"mutex" => [ "p13_3" ] }
})

asylum_application_p13_questions << Question.create({
  name:           'Yes',
  field_type:     'checkbox',
  seq_no:         3,
  form_id:        'form1[0].#subform[8].ckboxync6[0]',
  checkbox_value: '2',
  validations:    { :"mutex" => [ "p13_2" ] }
})

asylum_application_p13_questions << FormText.create({
  guidance:       'For each instance, specify in your response: what occurred and the circumstances, dates, length of sentence received, location, the duration of the detention or imprisonment, reason(s) for the detention or conviction, any formal charges that were lodged against you or your relatives included in your application, and the reason(s) for release. Attach documents referring to those incidents, if they are available, or an explanation of why documents are not available.',
  seq_no:         4,
  validations:    { :"show_dep" => "p13_3" }
})

asylum_application_p13_questions << Question.create({
  name:           '',
  field_type:     'text',
  seq_no:         5,
  form_id:        'form1[0].#subform[8].TextField19[2]',
  validations:    { :"show_dep" => "p13_3" },
  translate:      true
})

asylum_application_p13_questions.each do |q|
  q.page = asylum_application_p13
  q.save()
end

# TODO: signature (and translator?) section
