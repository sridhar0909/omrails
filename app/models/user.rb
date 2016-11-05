class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable
# removed:recoverable

 has_many :tweets
 has_many :stories
  
 validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
 validates :name, presence: true


# validates :password,  :presence => true,
#                       :on => :create,
#                       :format => {:with => /\A.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\@\#\$\%\^\&\+\=]).*\Z/ }

# validates_presence_of :email
# validates_uniqueness_of :email
# validates_format_of :email, :with => /.+@.+\..+/i  

end

