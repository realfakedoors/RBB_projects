# STOCK PICKER
# This program takes an array of daily stock prices 
# as input, then picks which days are optimal to buy and sell.

def stock_picker(input)
  
    best_profit = 0
    buy_sell_days = [0,0]
  
# Since we need to buy before we can sell, we should only consider
# buying up until the second-to-last day:
  
  for x in 0..input.length-2
    
# We'll always sell after we buy, so we use nested 'for' loops to
# check our sell value against our buy value and store our max profit:
    
    for y in 1+x..input.length-1
      
      profit = (input[y] - input[x])
      
      if profit > best_profit
        best_profit = profit
        buy_sell_days = [x,y]
      end
      
    end
    
  end
  
  return buy_sell_days
  
end

test = [1,4,88,23,1,11]
puts "#{stock_picker(test)}"