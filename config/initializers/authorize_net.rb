authorize_net_settings = YAML::load(File.open("#{Rails.root.to_s}/config/gateway.yml")) rescue nil

# ActiveMerchant::Billing::Base.mode = :production
ActiveMerchant::Billing::Base.mode = (['production'].include?(Rails.env) ? :production : :test)

::GATEWAY = ActiveMerchant::Billing::AuthorizeNetGateway.new(
  :login    => (!['production'].include?(Rails.env)) ? '62tUsQ4Jt5' : ENV[AUTHORIZE_NET_LOGIN_ID],
  :password => (!['production'].include?(Rails.env)) ? '5zS9G58cXPHf83wf' : ENV[AUTHORIZE_NET_PASSWORD],
  :test     => (!['production'].include?(Rails.env))
  # :test     => false
)