Feature: order product
I want to order products on the tiki page,
So that I have scenario.

Scenario: order product
Given navigate login page, search and order product
When input "apple" and order
Then check product add to cart