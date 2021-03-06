# -*- encoding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.new do |u|
  u.username = "andrew"
  u.email = 'andrewlutenko@gmail.com'
  u.password = '12345678'
  u.admin = true
end

admin.save!

den = User.new do |u|
  u.username = "den"
  u.email = 'den@gmail.com'
  u.password = '12345678'
  u.admin = true
end

den.save!


# site = Site.create( domain: "r-code.com", sub_domain: "r-code", name: "Redcod_1")
# main_menu = site.menus.create( title: "Main menu", block_id: 1)
# front_page_1 = Page.create(site_id: site.id, menu_id: main_menu.id, slug: "main", link_title: 'Главная', title: "Front page", body: "Site #{site.name} front page")
# site.update(front_page_id: front_page_1.id)
# menu_item_1 = MenuItem.create(page_id: front_page_1.id, title: front_page_1.title, menu_id: main_menu.id, link: '/')


# site_2 = Site.create( domain: "r-code2.com", sub_domain: "r-code2", name: "Redcod_2")
# main_menu2 = site_2.menus.create( title: "Main menu", block_id: 1)
# front_page_2 = Page.create(site_id: site_2.id, menu_id: main_menu2.id, slug: "main", title: "Front page", body: "Site #{site_2.name} front page")
# site_2.update(front_page_id: front_page_2.id)