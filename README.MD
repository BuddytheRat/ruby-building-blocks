*Project: Ruby Building Blocks
http://www.theodinproject.com/ruby-programming/building-blocks?ref=lnav

*Project 1: Caesar Cipher
Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

    > caesar_cipher("What a string!", 5)
    => "Bmfy f xywnsl!"

*Project 2: Stock Picker
Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

	> stock_picker([17,3,6,9,15,8,6,1,10])
	=> [1,4]  # for a profit of $15 - $3 == $12