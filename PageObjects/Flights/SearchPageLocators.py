
#side ai popup
ai_popup = '//img[@src = "https://jsak.mmtcdn.com/pwa/platform-myra-ui/static/sub_icons/close-icon.png"]'

flight_tab =  '//div[contains(@class,"chHeaderContainer")]//a[contains(normalize-space(.),"Flights")]'
one_way_radio = '//li[@data-cy = "oneWayTrip"]//child::span'
# from_city_input = '//input[@id = "fromCity"]'
from_city_box = '//input[@id="fromCity"]'
from_city_input_field = '//input[@placeholder="From"]'
# from_city_suggestion = '//li[contains(@class,"react-autosuggest__suggestion")]//span[contains(text(),"Pune")]'
from_city_suggestion = '(//div[contains(@class,"revampedSuggestionContent")]//child::span[contains(text(), "Selected City")])'
to_city_input = '//input[@id = "toCity"]'
to_city_input_field = '//input[@placeholder="To"]'
to_city_suggestion = '//li[contains(@id, "react-autowhatever")]//span[contains(text(), "To City")]'
# departure_date_input = '//input[@id="departure"]/ancestor::div[contains(@class,"fsw_inputBox")]'
return_date_input = '//p[text() = "Tap to add a return date for bigger discounts"]'
selected_date = '//div[contains(@class,"DayPicker-Day") and .//p[text()="4"] and not(contains(@class,"DayPicker-Day--disabled"))]'
regular_fare = '//div[@class = "fareCardItem "]//descendant::div[text() = "Regular"]'
search_button = '//a[contains(@class,"primaryBtn") and contains(text(),"Search")]'

# locator for calender
next_month_button = '//span[@role = "button" and @aria-label="Next Month"]'
dynamic_date_formate = '//div[contains(@aria-label, "DATE_HERE")]'

# locator for travellers & Class
travel_and_class = '//label[@for = "travellers"]'
adults_list = '//p[@data-cy = "adultRange"]//following-sibling::ul[1]'
number_of_adults = '//li[@data-cy = "adults-NO"]'

children_list = '//p[@data-cy = "childrenRange"]//following-sibling::ul[1]'
number_of_children = '//li[@data-cy = "children-NO"]'

infants_list = '//p[@data-cy = "infantRange"]//following-sibling::ul[1]'
number_of_infants = '//li[@data-cy = "infants-NO"]'

apply_button = '//button[@type = "button" and text() = "APPLY"]'


