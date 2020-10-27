Given('navigate login page and count products') do
  $driver.get('https://tiki.vn/')
  $driver.manage.window.resize_to(1130, 706) 
  end
  
  When('input {string} and count') do |string|
  #$search_bar = $driver.find_element(:css, ".eUnWAD")
  #$search_bar.send_keys(string,:enter)
  $driver.find_element(:css, ".eUnWAD").send_keys string, :enter
  $product_count = $driver.find_elements(:css, ".search-a-product-item")
  $product_count.count
  end
  
  Then('puts products') do
  puts $product_count
  end