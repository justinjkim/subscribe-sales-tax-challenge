### Thought process
Took about an hour just to understand the mechanism of how the sales and import duty tax calculations worked

took awhile to realize that you can add the tax percentages together (because we're ok with just the total tax amount, not the itemized ones)

### Assumptions
didn't realize that the sales tax subtotal at the end of each receipt actually includes both the basic sales and import duty tax.

### Input 1
```ruby
input = 
  {
    name: 'book',
    quantity: 2,
    price: 12.49,
    category: :book,
    imported: false
  },
  {
    name: 'music CD',
    quantity: 1,
    price: 14.99,
    category: :other,
    imported: false
  },
  {
    name: 'chocolate bar',
    quantity: 1,
    price: 0.85,
    category: :food,
    imported: false
  }  

```

```
# Output
2 book: 24.98 # because no taxes
1 music CD: 16.49 # because 14.99*1.1 rounds to 16.49
1 chocolate bar: 0.85 # because no sales or imported tax because it's food
Sales Taxes: 1.50 # because the only sales tax was from the music CD
Total: 42:32 # remember, the sales tax is already included in here
```

### Input 2
```ruby
input = 
  {
    name: 'imported box of chocolates',
    quantity: 1,
    price: 10.00,
    category: :food,
    imported: true
  },
  {
    name: 'imported bottle of perfume',
    quantity: 1,
    price: 47.50,
    category: :other,
    imported: true
  }
```
```
# Output
1 imported box of chocolates: 10.50 # no sales tax, but has imported tax
1 imported bottle of perfume: 54.65 # total is 54.625, but rounds up 

4.8 + 2.375 + 47.50

Imported box of chocolates at 10.00:

Food = exempt from 10% basic tax
Import tax = 5%
Tax calculation: (10.00 × 5/100) = 0.50
0.50 already ends in .05, so no rounding needed
Final price: 10.00 + 0.50 = 10.50

Imported perfume at 47.50:

Gets both basic (10%) and import (5%) = 15% total
Tax calculation: (47.50 × 15/100) = 7.125
7.125 rounds up to nearest 0.05 = 7.15
Final price: 47.50 + 7.15 = 54.65

Total taxes = 0.50 + 7.15 = 7.65
Total = 10.50 + 54.65 = 65.15
```
