# frozen_string_literal: true

wait = Selenium::WebDriver::Wait.new(timeout: 80)

Given('I have the Webmessage channel') do
	$web_driver.find_element(ElementWarehouse::EMAIL_FIELD).send_keys(TestUser.email)
	sleep 3
	$web_driver.find_element(ElementWarehouse::PASSWORD_FIELD).send_keys(TestUser.password)
	sleep 3
	$web_driver.find_element(ElementWarehouse::LOGIN_BUTTON).click
	$web_driver.find_element(ElementWarehouse::LOGIN_ACCOUNT_SELECT).click
	$web_driver.find_element(ElementWarehouse::COMPANY_UNIT_SELECT).click
	$web_driver.find_element(ElementWarehouse::CHANNELS_TAB).click
	sleep 3
end

Then('I adjust the settings') do
	$web_driver.find_element(ElementWarehouse::WEB_MESSAGE_DROP_DOWN).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WEB_MESSAGE_SETTINGS).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::PRE_CHAT_FORM_TOGGLE).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::CHAT_FORM_NAME_CHECKBOX).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::CHAT_FORM_EMAIL_CHECKBOX).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::CHAT_FORM_MOBILE_NUMBER_CHECKBOX).click
end

Then('I test if the settings have been applied') do
	open_new_tab
	sleep 3
	$web_driver.get(TestUser.qa_web_widget)
	wait.until { $web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET).displayed? }
	$web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::PRECHAT_FORM_NAME_FIELD).send_keys(TestUser.customer_name)
	sleep 3
	$web_driver.find_element(ElementWarehouse::PRECHAT_FORM_EMAIL_FIELD).send_keys(TestUser.gmail_email)
	sleep 3
	$web_driver.find_element(ElementWarehouse::PRECHAT_FORM_MOBILE_FIELD).send_keys(TestUser.mobile_number)
	sleep 3
	$web_driver.find_element(ElementWarehouse::START_CHAT_BUTTON).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET_CHAT_FIELD).send_keys('Webmessage settings test')
	sleep 3
	$web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET_CHAT_FIELD).send_keys(:return)
	sleep 3
	$web_driver.switch_to.window( $web_driver.window_handles.first )
	sleep 3
	$web_driver.find_element(ElementWarehouse::CONVERSATIONS_TAB).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::SELECT_INBOUND_CHAT).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::RESOLVE_DROP_DOWN).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::RESOLVE_BUTTON).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::AGENT_HOME_BUTTON).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::CHANNELS_TAB).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WEB_MESSAGE_DROP_DOWN).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WEB_MESSAGE_SETTINGS).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::PRE_CHAT_FORM_TOGGLE).click
end

Then('I customize the widget and check if the settings apply') do
	$web_driver.find_element(ElementWarehouse::CHANNELS_TAB).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WEB_MESSAGE_DROP_DOWN).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WEB_MESSAGE_SETTINGS).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WEB_MESSAGE_CUSTOMIZE_TAB).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WIDGET_TITLE_TEXT_FIELD).click
	$web_driver.action.key_down(:control).send_keys('a').key_down(:control).send_keys('c').key_up(:control).perform
	$web_driver.find_element(ElementWarehouse::WIDGET_TITLE_TEXT_FIELD).send_keys('Updated_Web_Title')
	sleep 3
	$web_driver.find_element(ElementWarehouse::WEB_WIDGET_COLOR).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WEB_WIDGET_COLOR_PICKER).click
	sleep 3
	scroll_to($web_driver.find_element(ElementWarehouse::WEB_WIDGET_COLOR_OK_BUTTON))
	sleep 4
	$web_driver.find_element(ElementWarehouse::WEB_WIDGET_COLOR_OK_BUTTON).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::UPDATE_CHANNEL_SETTINGS_BUTTON).click
	sleep 3
	scroll_to($web_driver.find_element(ElementWarehouse::WIDGET_TITLE_TEXT_FIELD))
	$web_driver.find_element(ElementWarehouse::WIDGET_TITLE_TEXT_FIELD).click
	$web_driver.action.key_down(:control).send_keys('a').key_down(:control).send_keys('c').key_up(:control).perform
	$web_driver.find_element(ElementWarehouse::WIDGET_TITLE_TEXT_FIELD).send_keys('Nguniland')
	sleep 3
	$web_driver.find_element(ElementWarehouse::UPDATE_CHANNEL_SETTINGS_BUTTON).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::DASHBOARD).click
end

Then('I Position the web widget and add preview text') do
	$web_driver.find_element(ElementWarehouse::CHANNELS_TAB).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WEB_MESSAGE_DROP_DOWN).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WEB_MESSAGE_SETTINGS).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WEB_MESSAGE_CUSTOMIZE_TAB).click
	sleep 3
	scroll_to($web_driver.find_element(ElementWarehouse::BUTTON_POSITIONING_LEFT))
	sleep 3
	$web_driver.find_element(ElementWarehouse::BUTTON_POSITIONING_LEFT).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WIDGET_BUTTON_PREVIEW_TOGGLE).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::WIDGET_PREVIEW_TEXT_FIELD).send_keys('Kumnandi Gqithi ukuba ngu Mxhosa')
	sleep 3
	$web_driver.find_element(ElementWarehouse::UPDATE_CHANNEL_SETTINGS_BUTTON).click
	open_new_tab
	$web_driver.get(TestUser.qa_web_widget)
	wait.until { $web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET).displayed? }
	sleep 4
	$web_driver.switch_to.window( $web_driver.window_handles.first )
	$web_driver.find_element(ElementWarehouse::BUTTON_POSITIONING_RIGHT).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::UPDATE_CHANNEL_SETTINGS_BUTTON).click
	sleep 3
	$web_driver.switch_to.window( $web_driver.window_handles.last )
	$web_driver.navigate.refresh
	$web_driver.navigate.refresh
	$web_driver.get(TestUser.qa_web_widget)
	wait.until { $web_driver.find_element(ElementWarehouse::QA_WEB_WIDGET).displayed? }
	sleep 4
	$web_driver.switch_to.window( $web_driver.window_handles.first )
	sleep 3
	$web_driver.find_element(ElementWarehouse::WIDGET_PREVIEW_TEXT_FIELD).click
	sleep 3
	$web_driver.action.key_down(:control).send_keys('a').key_down(:control).send_keys('c').key_up(:control).perform
	sleep 3
	$web_driver.action.key_down(:backspace).perform
	sleep 3
	$web_driver.find_element(ElementWarehouse::WIDGET_BUTTON_PREVIEW_TOGGLE).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::UPDATE_CHANNEL_SETTINGS_BUTTON).click
	sleep 3
	$web_driver.find_element(ElementWarehouse::DASHBOARD).click
	sleep 3
end