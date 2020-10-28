Given('navigate login page, search and order product') do
    $driver.get ('https://tiki.vn/')
    $driver.manage.window.maximize
  end
  
  When('input {string} and order') do |string|
    $search_bar = $driver.find_element(:css, ".eUnWAD")
    $search_bar.send_keys(string,:enter)
    $driver.manage.timeouts.implicit_wait = 5
    $check_box = $driver.find_element(:css, ".category-filter")
    $check_box.click
    sleep (10)
    #$pop_up = $driver.find_element(:css, ".a-modal-header")
    #$driver.find_element(:css, ".apply-btn")
    
  end
  
  Then('mess {string}') do |string|
    
  end
  