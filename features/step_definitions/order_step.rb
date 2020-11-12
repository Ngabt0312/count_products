Given('navigate login page, search and order product') do
  $driver.get ('https://tiki.vn/')
  $driver.manage.window.maximize
end
When('input {string} and order') do |string|
  #tìm kiếm sản phẩm apple
  $product_number = "2"
  $search_bar = $driver.find_element(:css, ".eUnWAD")
  $search_bar.send_keys(string,:enter)
  $check_box = $driver.find_element(:css, "label.is-tikinow").click #chọn check box Tiki
  $driver.find_element(:css, ".apply-btn").click
  options = $driver.find_elements(:css, "select.form-control")  #tìm selectlist

  $dropdown = Selenium::WebDriver::Support::Select.new(options[0])  #chọn thành phố
  $driver.manage.timeouts.implicit_wait = 2.5
  $dropdown.select_by(:text, "Hà Nội")

  $dropdown = Selenium::WebDriver::Support::Select.new(options[1]) #chọn huyện
  $driver.manage.timeouts.implicit_wait = 2.5
  $dropdown.select_by(:text, "Quận Cầu Giấy")

  $dropdown = Selenium::WebDriver::Support::Select.new(options[2])   #chọn phường
  $driver.manage.timeouts.implicit_wait = 2.5
  $dropdown.select_by(:text, "Phường Dịch Vọng")
  $driver.find_element(:xpath, ".//button[contains(text(),'GIAO ĐẾN ĐỊA CHỈ NÀY')]").click #tìm theo contains
  $driver.manage.timeouts.implicit_wait = 3
  $product_count= $driver.find_elements(:css, "p.title")
  $product_title = $product_count[4].text.delete("...")
  $product_count[4].click
  expect($driver.find_element(:css, "h1.title").text).to include($product_title)

  # add to cart
  #$driver.find_element(:css, "input.input")
end

Then('check product add to cart') do

end
  