Then('I click on Stats') do
  $web_driver.find_element(ElementWarehouse::STATS_TAB).click
  $web_driver.find_element(ElementWarehouse::CHANNELS_TAB).click
  $web_driver.find_element(ElementWarehouse::TEAMS_TAB).click
  $web_driver.find_element(ElementWarehouse::PEOPLE_TAB).click
  $web_driver.find_element(ElementWarehouse::DOCUMENT_LIBRARY_TAB).click
  $web_driver.find_element(ElementWarehouse::FAQ_TAB).click
  $web_driver.find_element(ElementWarehouse::CONVERSATION_HISTORY_TAB).click
  $web_driver.find_element(ElementWarehouse::BILLING).click
end