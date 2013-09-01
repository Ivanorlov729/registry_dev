class PaymentMailer < ActionMailer::Base

  default :from => Proc.new{ ['staging','production'].include?(Rails.env) ? "Interior Design <boyawards@interiordesign.net>" : "XOlator Dev <dev@xolator.com>" },
          :charset => 'UTF-8', 'Content-Transfer-Encoding' => 'Quoted-printable', 'Content-Disposition' => 'inline'


  # --- PAYMENT RECEIPT -------------------------------------------------------

  # Send user a payment receipt
  def payment_receipt(payment)
    load_default_opts

    @payment = payment
    to = 'dev@xolator.com' if prod? # PROTECT WHEN TESTING!
    to ||= payment.user.email

    mail(:to => to, :subject => 'Thank You!') do |format|
      format.text
    end
  end



# --- FUNCTIONS ---------------------------------------------------------------

protected

  def support_email; 'boyawards@interiordesign.net'; end

  def prod?; ['production'].include?(Rails.env); end

  def load_default_opts
    #
  end

end
