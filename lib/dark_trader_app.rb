require 'rubocop'
require 'pry'
require 'rspec'
require 'nokogiri'
require 'open-uri'

def crypto_name  #forme un array avec les différents noms de crypto
  devise_name_array = []
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    page.xpath('/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/*/td[3]/div').each do |node|
      devise_name_array << node.text
      return devise_name_array
    end   
end

def crypto_price  #forme un array avec les différents prix de crypto
  devise_currency_array = []
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    page.xpath('/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/*/td[5]/div/a/span').each do |node|
      devise_currency_array << node.text
      return devise_currency_array
    end
end

def array_fusion(devise_name_array,devise_currency_array)   #fusionne les 2 arrays (le nom des crypto, le prix de celles-ci)
  final_array = []
  fusioned_array = devise_name_array.zip(devise_currency_array).to_h
  final_array << fusioned_array
  puts final_array
end

def perform
  #crypto_name
  #crypto_price
  array_fusion(crypto_name,crypto_price)  
end

perform
