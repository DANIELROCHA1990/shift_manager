require 'rails_helper'

RSpec.describe "shifts/show", type: :view do
  before(:each) do
    @shift = assign(:shift, Shift.create!(
      clock_in: "Clock In",
      clock_out: "Clock Out",
      all_clock: "All Clock"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Clock In/)
    expect(rendered).to match(/Clock Out/)
    expect(rendered).to match(/All Clock/)
  end
end
