authorize_net_settings = YAML::load(File.open("#{Rails.root.to_s}/config/gateway.yml")) rescue nil

# ActiveMerchant::Billing::Base.mode = :production
ActiveMerchant::Billing::Base.mode = (['production'].include?(Rails.env) ? :production : :test)

::GATEWAY = ActiveMerchant::Billing::AuthorizeNetGateway.new(
  :login    => '62tUsQ4Jt5',
  :password => '5zS9G58cXPHf83wf',
  :test     => (!['production'].include?(Rails.env))
  # :test     => false
)