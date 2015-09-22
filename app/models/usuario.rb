class Usuario < ActiveRecord::Base
    apply_simple_captcha
    validates :Nombre, :email, presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :email, uniqueness: true
end
