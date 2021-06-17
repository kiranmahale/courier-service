class Recipient < User
	validates_presence_of :full_name, message: 'of recipient should present'
	validates_presence_of :address, message: 'of recipient should present'
	validates_presence_of :mobile, message: 'of recipient should present'
	validates_presence_of :pincode, message: 'of recipient should present'
	validates_presence_of :email, message: 'of recipient should present'
end