# Intro
My name is Justin Kim, and I'm currently a Lead Software Engineer at Maverick Solutions. This is my attempt at solving
the Subscribe code challenge within the 4-hour time limit.

## Resources used
To be upfront, I definitely had to utilize the help of Claude.AI to understand some of the tax calculation logic (especially the part
about rounding to the 0.05 cents! I'm not a math guy.) For example, I had assumed that the import and sales taxes
were calculated separately first before combining them and was frustrated in why I couldn't get the numbers to add up
(no pun intended), but with the help of Claude, I realized that the tax percentages were added first, and _then_ it was
calculated against the base price:
```
Imported box of chocolates at 10.00:

Sales tax = exempt from 10% basic tax, because it's a food category
Import tax = 5%
Tax calculation: (10.00 × 5/100) = 0.50
0.50 already ends in .05, so no rounding needed
Final price: 10.00 + 0.50 = 10.50
---
Imported perfume at 47.50:

Gets both basic (10%) and import (5%) = 15% total
Tax calculation: (47.50 × 15/100) = 7.125
7.125 rounds up to nearest 0.05 = 7.15
Final price: 47.50 + 7.15 = 54.65

Total taxes = 0.50 + 7.15 = 7.65
Total = 10.50 + 54.65 = 65.15
```
After reading the requirements multiple times and understanding
the general flow, I did my best to not use Claude.AI as much. Although the requirements didn't mention that I couldn't
use an AI assistant, I wanted to make sure that I tried to think out my strategy beforehand without too much input
from an external resource. I did initially think of using some object-oriented principles here, and Claude helped me
to tidy up some of the code, or to at least get the general boilerplate setup. 

## Assumptions made
While I thought about using string inputs as demonstrated in the challenge, I eventually settled to just assuming that
I could pass in an array of hashes that represented an object. However, I also realize that my app would only work if
you pass in pre-determined data beforehand, such as the item's category or import status. In the future, I could try
using regex to parse out a string input if that really was the requirement, but for the sake of time, I decided to
make the luxurious assumption that an array of hashes was acceptable.

## Commit history
I'm a pretty big believer in writing detailed commit descriptions, as they can provide valuable insight for future
devs on why code was written in a certain way. Feel free to look at my commit history to get a more detailed look.
You can also see [this video](https://www.youtube.com/watch?v=8OOTVxKDwe0) that has greatly shaped my view towards writing good commits.

## General structure of app
```
sales_tax/
├── lib/
│   ├── item.rb
│   ├── tax_calculators/
│   │   ├── basic_sales_tax_calculator.rb
│   │   └── import_tax_calculator.rb
│   ├── tax_calculator_factory.rb
│   └── receipt.rb
├── spec/
│   ├── item_spec.rb
│   ├── tax_calculators/
│   │   ├── basic_sales_tax_calculator_spec.rb
│   │   └── import_tax_calculator_spec.rb
│   ├── tax_calculator_factory_spec.rb
│   └── receipt_spec.rb
└── README.md
```
**Note: I did not get to finish writing specs for the tax calculators themselves, but they probably would've been
very simple tests, just verifying that the tax rates were correct.**


# Setup
This is a very basic Ruby app that doesn't incorporate any framework such as Rails. It does include RSpec for testing
purposes, but that's about it. 

Since I wanted to honor the 4-hour time window, I did not get to write a very simple script that the user could run to
enter their own inputs into the app, but I have at least specs that pass and seem to match the challenge's requirements.
To run the specs, you can simply run `rspec` in the root folder of this app. You can also look at the specs themselves
to ensure that I am testing things adequately. They are located in the `spec` folder.
