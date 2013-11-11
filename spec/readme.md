- __Mocks/Doubles/Stubs__
All the same thing. A test double is an object that stands in for another object in an example (test)

    user = mock(:user)
    user = double(:user)
    user = stub(:user)


- __Message Stubs__
Returning a predefined response to a message within a code example

    user.stub(:name).and_return("Bobby McFerrin")
    user.stub(:name => "Bobby McGee")
    user = mock(:user, :name => "Bobby McFerrin")
    
- __Chaining Stubs__
Sometimes you need to stub deep (watch out for this, it's a bad code smell). `stub_chain` can help:

    user.stub_chain(:account, :billing_address).and_return("717 California St.")
    user.account.billing_address # 717 California St.
  
- __Expectations__
A method stub that will raise an error if it is never called.

  user.should_receive(:name).and_return("Bobby McFerrin")
