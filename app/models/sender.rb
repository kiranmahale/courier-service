class Sender < User
	validates_presence_of :full_name, message: 'of sender should present'
	validates_presence_of :address, message: 'of sender should present'
	validates_presence_of :pincode, message: 'of sender should present'
	validates_presence_of :email, message: 'of sender should present'
end