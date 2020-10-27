require'selenium-webdriver'
require'rspec'
require'rubygems'
require'watir-webdriver'

Given('navigate login page and count products') do
  @driver = Selenium::WebDriver.for :chrome
  @driver.get('https://tiki.vn/')
  @driver.manage.window.resize_to(1130, 706) 
  end
  
  When('input {string} and search') do |string|
  #@search_bar = @driver.find_element(:css, ".eUnWAD")
  #@search_bar.send_keys(string,:enter)
  @driver.find_element(:css, ".eUnWAD").send_keys string, :enter
  @driver.find_elements(:css, "search-a-product-item")
  @count_product = @driver.count(:css, ".search-a-product-item").count()
  puts @count_product
  end
  
  Then('puts products') do
  
  end