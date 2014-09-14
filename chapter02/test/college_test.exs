defmodule CollegetTest do
  use ExUnit.Case

  test "make_room_list" do
    input_str = "64850,ENGL 033,RF141\n64851,ENGL 080,SC103\n64853,ENGL 102,C101B\n"
    hd = HashDict.new
    HashDict.put(hd, "RF141", ["ENGL 033"])
    HashDict.put(hd, "SC103", ["ENGL 080"])
    HashDict.put(hd, "C101B", ["ENGL 102"])
    assert College.make_room_list_helper(input_str) == hd
  end
end
