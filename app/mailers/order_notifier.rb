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

  def information(order, current_site)
    @current_site = current_site
    @order = order

    mail to: current_site.owner_email, subject: 'Новый заказ'
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
