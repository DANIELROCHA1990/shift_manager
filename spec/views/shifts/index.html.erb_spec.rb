require 'rails_helper'

RSpec.describe "shifts/index", type: :view do
  before(:each) do
    assign(:shifts, [
      Shift.create!(
        clock_in: "Clock In",
        clock_out: "Clock Out",
        all_clock: "All Clock"
      ),
      Shift.create!(
        clock_in: "Clock In",
        clock_out: "Clock Out",
        all_clock: "All Clock"
      )
    ])
  end

  it "renders a list of shifts" do
    render
    assert_select "tr>td", text: "Clock In".to_s, count: 2
    assert_select "tr>td", text: "Clock Out".to_s, count: 2
    assert_select "tr>td", text: "All Clock".to_s, count: 2
  end
end
