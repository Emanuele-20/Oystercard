Write an RSpec test for the Oystercard class that will test that a
freshly initialized card has a balance of 0 by default, see it fail,
then write an implementation
(Oystercard class code) that will make the test pass.


In order to use public transport
As a customer
I want money on my card

Objects	(nouns) - class	|  Messages (verbs) - methods

card                       balance
#####################################################################

Write a new test that checks that if a top_up method is invoked with
the top up value as the argument, the balance of the card
will increase by that amount.

In order to keep using public transport
As a customer
I want to add money to my card

Objects	(nouns) - class	|  Messages (verbs) - methods

card                       top_up

Use test-driven development approach to update the
top_up method to raise an error if the action would
take the card beyond the limit.
####################################################################

In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card

Objects	(nouns) - class	|  Messages (verbs) - methods
card                       max_limit
####################################################################

In order to pay for my journey
As a customer
I need my fare deducted from my card

Objects	(nouns) - class	|  Messages (verbs) - methods
card                        deducted

####################################################################

In order to get through the barriers.
As a customer
I need to touch in and out.

Objects	(nouns) - class	|  Messages (verbs) - methods
card                      in_journey?
                          touch_in
                          touch_out 