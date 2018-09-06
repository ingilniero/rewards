require "application_system_test_case"

class AppFlowsTest < ApplicationSystemTestCase
  test "giving a piece to another user" do
    aranza = users(:aranza)
    angel = users(:angel)

    sign_in aranza
    visit '/rewards'
    click_on 'New Bestowment'
    select 'Angel', from: 'bestowment_bestowed_id'
    click_on 'Create Bestowment'

    assert_selector 'p', text: 'Bestowment created successfully!'

    sign_in angel
    visit '/rewards'

    assert_text 'State: incomplete'
    assert_text 'first_quarter'
  end

  test "rewards" do
    aranza = users(:aranza)
    haro = users(:haro)

    sign_in aranza
    visit '/rewards'

    click_on 'New Bestowment'
    select 'Haro', from: 'bestowment_bestowed_id'
    click_on 'Create Bestowment'

    assert_selector 'p', text: 'Bestowment created successfully!'

    sign_in haro

    visit '/rewards'

    assert_text 'first_quarter'
    assert_text 'second_quarter'
    assert_text 'third_quarter'
    assert_text 'State: complete'
  end
end
