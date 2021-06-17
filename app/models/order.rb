class Order < ApplicationRecord
	belongs_to :sender#, class_name: "User", dependent: :destroy, foreign_key: :sender_id, required: true
	belongs_to :recipient#, class_name: "User", dependent: :destroy, foreign_key: :recipient_id, required: true

	before_validation :create_parcel_number

	validates :weight, :service_type, :cost, :payment_mode, :parcel_number, presence: :true
	validates_presence_of :sender_id, message: 'Sender should present'
	validates_presence_of :recipient_id, message: 'Receiver should present'  


	def create_parcel_number
    	self.parcel_number = generate_parcel_number
  	end

  	private

  	def generate_parcel_number
	   loop do
	     number = SecureRandom.random_number(10000000)
	     parcel_number = "PN#{number}"

	     break parcel_number unless Order.where(parcel_number: parcel_number).exists?
	   end
	end
end
