require'selenium-webdriver'
require'rspec'
require'rubygems'
$driver = Selenium::WebDriver.for :chrome
at_exit do
    $driver.quit
end