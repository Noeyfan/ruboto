activity Java::org.ruboto.test_app.SubclassActivity

setup do |activity|
  start = Time.now
  loop do
    @text_view = activity.findViewById(42)
    @list_view = activity.findViewById(43)
    break if (@text_view && @list_view) || (Time.now - start > 60)
    sleep 1
  end
  assert @text_view
  assert @list_view
end

test('item click sets text') do |activity|
  activity.run_on_ui_thread { @list_view.performItemClick(@list_view, 1, 1) }
  assert_equal '[Record one]', @text_view.text
end

class MyObject < java.lang.Object
  attr_reader :my_param

  def initialize(my_param)
    super()
    @my_param = my_param
  end
end

test('add constructor with parameter') do
  o = MyObject.new('It works!')
  assert_equal 'It works!', o.my_param
end
