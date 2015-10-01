# Load the Rails application.
require File.expand_path('../application', __FILE__)

#cargamos el fichero env_vars.rb donde se carga el valor de las contraseñas.
# Load the app's custom environment variables here, before environments/*.rb
env_vars = File.join(Rails.root, 'config', 'initializers', 'env_vars.rb')
load(env_vars) if File.exists?(env_vars)



# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
:address        => 'smtp.sendgrid.net',
:port           => '587',
:authentication => :plain,
:user_name      => ENV['SENDGRID_USERNAME'],
:password       => ENV['SENDGRID_PASSWORD'],
:domain         => 'pocasluces.es',
:enable_starttls_auto => true
}