require 'rails_helper'

RSpec.describe "shifts/new", type: :view do
  before(:each) do
    assign(:shift, Shift.new(
      clock_in: "MyString",
      clock_out: "MyString",
      all_clock: "MyString"
    ))
  end

  it "renders new shift form" do
    render

    assert_select "form[action=?][method=?]", new_user_shift_path, "post" do

      assert_select "input[name=?]", "shift[clock_in]"

      assert_select "input[name=?]", "shift[clock_out]"

      assert_select "input[name=?]", "shift[all_clock]"
    end
  end
end
