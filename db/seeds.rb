# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Delete existing records first to avoid fk error on seed
ClassAssignment.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE class_assignments_id_seq RESTART WITH 1;")
User.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
Student.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE students_id_seq RESTART WITH 1;")
Teacher.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE teachers_id_seq RESTART WITH 1;")
Subject.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE subjects_id_seq RESTART WITH 1;")

user = User.create! :email => "admin@edukproject.com", :password => "edukpass", :first_name => "Eduk", :last_name => "Admin"


student = Student.create! :email => "john@student.com", :password => "password1", :first_name => "John", :last_name => "Doe"
student = Student.create! :email => "dave@student.com", :password => "password2", :first_name => "Dave", :last_name => "Grohl"
student = Student.create! :email => "jack@student.com", :password => "password3", :first_name => "Jack", :last_name => "Wilshere"


teacher = Teacher.create! :first_name => "Aaron", :last_name => "Ramsey"
teacher = Teacher.create! :first_name => "Leo", :last_name => "Messi"
teacher = Teacher.create! :first_name => "Tony", :last_name => "Hawk"


subject = Subject.create! :subject_code => "Math 101", :subject_name => "Algebra", :slug => "1-Math-101-Algebra"
subject = Subject.create! :subject_code => "Math 102", :subject_name => "Trigonometry", :slug => "2-Math-102-Trigonometry"
subject = Subject.create! :subject_code => "Biology 110", :subject_name => "Mammals", :slug => "3-Biology-110-Mammals"
subject = Subject.create! :subject_code => "PE 2", :subject_name => "Basketball", :slug => "4-PE-2-Basketball"


ca = ClassAssignment.create! :teacher_id => 1, :subject_id => 1, :slug => "1-aaron-ramsey-math-101-algebra"
ca = ClassAssignment.create! :teacher_id => 1, :subject_id => 2, :slug => "2-aaron-ramsey-math-102-trigonometry"
ca = ClassAssignment.create! :teacher_id => 2, :subject_id => 3, :slug => "3-leo-messi-biology-110-mammals"
ca = ClassAssignment.create! :teacher_id => 3, :subject_id => 4, :slug => "4-tony-hawk-pe-2-basketball"
ca = ClassAssignment.create! :teacher_id => 2, :subject_id => 1, :slug => "5-leo-messi-math-101-algebra"
ca = ClassAssignment.create! :teacher_id => 3, :subject_id => 3, :slug => "6-tony-hawk-biology-110-mammals"