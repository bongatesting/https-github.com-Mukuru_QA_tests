# frozen_string_literal: true

wait = Selenium::WebDriver::Wait.new(timeout: 80)

Given('I have a bot assigned') do
	$web_driver.find_element(ElementWarehouse::EMAIL_FIELD).send_keys(TestUser.email)
	sleep 3
	$web_driver.find_element(ElementWarehouse::PASSWORD_FIELD).send_keys(TestUser.password)
	sleep 3
	$web_driver.find_element(ElementWarehouse::LOGIN_BUTTON).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::LOGIN_ACCOUNT_SELECT).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::COMPANY_UNIT_SELECT).click
	sleep 3
end
Then('I set the Concurrent Conversation Limit and Test it') do
	$web_driver.find_element(ElementWarehouse::COMPANY_UNIT_SETTINGS).click
	sleep 6
	$web_driver.find_element(ElementWarehouse::SETTINGS_TAB).click
	sleep 5
	scroll_to($web_driver.find_element(ElementWarehouse::CONCURRENT_CONVERSATION_LIMIT_TOGGLE))
	sleep 5
	$web_driver.find_element(ElementWarehouse::CONCURRENT_CONVERSATION_LIMIT_TOGGLE).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::CONCURRENT_CONVERSATION_LIMIT_FIELD).click
	$web_driver.action.key_down(:control).send_keys('a').key_down(:control).send_keys('c').key_up(:control).perform
	sleep 5
	$web_driver.find_element(ElementWarehouse::CONVERSATION_LIMIT_FIELD).send_keys('2')
	sleep 5
	$web_driver.find_element(ElementWarehouse::CONVERSATION_LIMIT_SAVE_BUTTON).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::DASHBOARD).click
	open_new_tab
	$web_driver.get(TestUser.qa_web_widget)
	sleep 3
	wait.until { $web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET).displayed? }
	$web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET_CHAT_FIELD).send_keys('This is a concurrent conversation Limit Test')
	sleep 3
	$web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET_CHAT_FIELD).send_keys(:return)
	$web_driver.close.last
	$web_driver.switch_to.window( $web_driver.window_handles.first )
	sleep 3
	$web_driver.find_element(ElementWarehouse::CONVERSATIONS_TAB).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::CONVO_BOTS_TAB).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::QA_SELECT_BOT_CHAT).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::QA_CLAIM_BOT_CHAT_BUTTON).click
end