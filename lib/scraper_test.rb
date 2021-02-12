require 'nokogiri'
require 'open-uri'
require 'pry'
html = open("https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html")

doc = Nokogiri::HTML(html)


data = doc.css('a[href]') 
foliage_plants = data.each.map{|plant| {"name" => plant.inner_html, "link" => plant["href"]}}.slice(37..144) 
flowering_house_plants = data.each.map{|plant| {"name" => plant.inner_html, "link" => plant["href"]}}.slice(146..250) 
cacti_succulents = data.each.map{|plant| {"name" => plant.inner_html, "link" => plant["href"]}}.slice(252..280)



foliage_plants.each do |plant, link|
    puts "Name: #{plant["name"]} \n Link: #{plant["link"]}"
end
flowering_house_plants.each do |plant, link|
    puts "Name: #{plant["name"]} \n Link: #{plant["link"]}"
end
cacti_succulents.each do |plant, link|
    puts "Name: #{plant["name"]} \n Link: #{plant["link"]}"
end
