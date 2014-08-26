#encoding: UTF-8
class OrderNotifier < ActionMailer::Base
  default from: "Administration"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject: 'Подтверждение заказа'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  #def shipped
  #  @greeting = "Hi"

    #mail to: "to@example.org"
  #end
end
