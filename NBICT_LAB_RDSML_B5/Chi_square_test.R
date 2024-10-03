### If we flip a coin 100 times and we get 40 head
### and 60m tails , is this coin biased?
Observed <- c(40,60)
expected <- c(0.50,0.50)
chisq.test(x= Observed,p=expected)

##Example 2

shirt_original_sale <- c(211,402,297,80)
shirt_expected_sale <- c(0.2,0.4,0.3,0.1)
chisq.test(x=shirt_original_sale,p=shirt_expected_sale)
