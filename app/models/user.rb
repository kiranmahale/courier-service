class User < ApplicationRecord
	# has_one :sent_order, class_name: "Order", foreign_key: :sender_id
	# has_one :received_order, class_name: "Order", foreign_key: :recipient_id

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :mobile, :numericality => true,
                 :length => { :is => 10 }
    validates :pincode, :numericality => true,
                 :length => { :is => 6 }

    validates_format_of :email, with: VALID_EMAIL_REGEX
end
