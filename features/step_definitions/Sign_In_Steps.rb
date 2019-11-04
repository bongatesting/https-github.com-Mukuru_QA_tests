# frozen_string_literal: true

Given('I am on the Sign In Page') do
	$web_driver.find_element(ElementWarehouse::WIDGET).click
	visa = $web_driver.find_element(xpath: '/html/body/div[2]/div/div[1]/div[2]/div[3]/div[1]/div/div/div[1]')
	expect(visa.text).to include('Hi! Welcome to hi.guru.')
	visa = $web_driver.find_element(xpath: '/html/body/div[2]/div/div[1]/div[2]/div[3]/div[1]/div/div/div[1]')
	expect(visa.text).to include('Let’s boost')
	visa = $web_driver.find_element(xpath: '/html/body/div[2]/div/div[1]/div[2]/div[3]/div[1]/div/div/div[1]')
	expect(visa.text).to include('your business growth and customer')
	visa = $web_driver.find_element(xpath: '/html/body/div[2]/div/div[1]/div[2]/div[3]/div[1]/div/div/div[1]')
	expect(visa.text).to include('engagement!Excited? So am I! Let’s')
	visa = $web_driver.find_element(xpath: '/html/body/div[2]/div/div[1]/div[2]/div[3]/div[1]/div/div/div[1]')
	expect(visa.text).to include('get chatting, how can I assist you')
	visa = $web_driver.find_element(xpath: '/html/body/div[2]/div/div[1]/div[2]/div[3]/div[1]/div/div/div[1]')
	expect(visa.text).to include('today?')
end

When('I Sign in with Invalid Credentials') do

end

Then('I Sign in with Demo Credentials') do

end

Then('I Sign in with my own valid Credentials') do

end

When('I Sign out') do

end

Given('I am already signed in') do

end