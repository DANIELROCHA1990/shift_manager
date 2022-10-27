require 'rails_helper'

RSpec.describe "shifts/edit", type: :view do
  before(:each) do
    @shift = assign(:shift, Shift.create!(
      clock_in: "MyString",
      clock_out: "MyString",
      all_clock: "MyString"
    ))
  end

  it "renders the edit shift form" do
    render

    assert_select "form[action=?][method=?]", shift_path(@shift), "post" do

      assert_select "input[name=?]", "shift[clock_in]"

      assert_select "input[name=?]", "shift[clock_out]"

      assert_select "input[name=?]", "shift[all_clock]"
    end
  end
end
