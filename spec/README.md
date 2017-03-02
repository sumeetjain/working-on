Example spec:

```ruby
RSpec.describe("Banana", '#eat') do
  it("sets amount to 0") do
    # Setup
    banana = Banana.new

    # Exercise
    banana.eat

    # Verify
    expect(banana.amount_left).to(eq(0))
  end

  it("creates a peel") do
    # Setup
    banana = Banana.new

    # Exercise
    banana.eat

    # Verify
    expect(banana.peel).to_not(be_nil)
  end
end
```