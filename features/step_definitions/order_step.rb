Given('navigate login page, search and order product') do
  $driver.get ('https://tiki.vn/')
  $driver.manage.window.maximize
end

When('input {string} and order') do |string|
  $search_bar = $driver.find_element(:css, ".eUnWAD")
  $search_bar.send_keys(string,:enter)
  $check_box = $driver.find_element(:css, ".checkbox.is-tikinow")
  $check_box.click
  sleep (3)
  $driver.find_element(:css, ".text-center").click
end

Then('mess {string}') do |string|
  
end
  