# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin_attrs = {email: 'admin@admin.com', password: 'Admin@123', password_confirmation: 'Admin@123'}
admin = Admin.new(admin_attrs)
# admin.skip_confirmation!
admin.save!