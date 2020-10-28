Given('navigate login page and count products') do
  $driver.get('https://tiki.vn/')
  #$driver.manage.window.resize_to(1130, 706)
  $driver.manage.window.maximize
end
  
When('input {string} and count') do |string|
  $search_bar = $driver.find_element(:css, ".eUnWAD")
  $search_bar.send_keys(string,:enter)
  #$driver.find_element(:css, ".eUnWAD").send_keys string, :enter
  $product_count = $driver.find_elements(:css, ".search-a-product-item")
  $number_product= $product_count.count 
end
  
  Then('puts products') do
  puts $number_product
end