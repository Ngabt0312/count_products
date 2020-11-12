Given('navigate login page, search and order product') do
  $driver.get ('https://tiki.vn/')
  $driver.manage.window.maximize
end
When('input {string} and order') do |string|
  #tìm kiếm sản phẩm apple
  $product_number = "2"
  $search_bar = $driver.find_element(:css, ".eUnWAD")
  $search_bar.send_keys(string,:enter)
  sleep (2)
  #chọn check box Tiki
  $check_box = $driver.find_element(:css, "label.is-tikinow").click 
  $driver.find_element(:css, '.apply-btn').click
  #tìm selectlist
  options = $driver.find_elements(:css, "select.form-control")  
  #chọn thành phố
  $dropdown = Selenium::WebDriver::Support::Select.new(options[0])  
  $driver.manage.timeouts.implicit_wait = 2.5
  $dropdown.select_by(:text, "Hà Nội")
  #chọn huyện
  $dropdown = Selenium::WebDriver::Support::Select.new(options[1]) 
  $driver.manage.timeouts.implicit_wait = 2.5
  $dropdown.select_by(:text, "Quận Cầu Giấy")
  #chọn phường
  $dropdown = Selenium::WebDriver::Support::Select.new(options[2])   
  $driver.manage.timeouts.implicit_wait = 2.5
  $dropdown.select_by(:text, "Phường Dịch Vọng")
  $driver.manage.timeouts.implicit_wait = 2.5
  #click đóng popup chọn địa chỉ giao hàng
  $driver.find_element(:xpath, ".//button[contains(text(),'GIAO ĐẾN ĐỊA CHỈ NÀY')]").click 
  sleep (5)
  #đếm số product và verify title của product
  $product_count= $driver.find_elements(:css, "p.title")
  $product_title = $product_count[4].text.delete("...")
  $product_count[4].click
  sleep (2)
  $verify_title = expect($driver.find_element(:css, "h1.title").text).to include($product_title)
  # add to cart
  $driver.find_element(:css, ".input").send_keys :backspace
  $driver.find_element(:css, ".input").send_keys ($product_number)
  $driver.find_element(:css, ".btn.btn-add-to-cart").click
end
Then('login input {string} and {string}') do |string, string2|
  # check lại trong giỏ hàng
  $driver.manage.timeouts.implicit_wait = 2.5
  $driver.find_element(:css, ".gGRKbG").click
  #login 
  $driver.find_element(:id, "email").send_keys (string)
  $driver.find_element(:id, "password").send_keys (string2)
  $driver.find_element(:css, ".GBpke").click
  sleep (5)
  #expect($driver.find_element(:css,".cart-products__name").text).to include($verify_title)
end
  
  