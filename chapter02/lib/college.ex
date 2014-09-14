defmodule College do
  def make_room_list(file) do
    {:ok, content} = File.read file
    make_room_list_helper(content)
  end

  def make_room_list_helper(content) do
    hd = HashDict.new
    String.split(String.rstrip(content), "\n")
    |> Enum.each(fn line ->
      [_id, course, room] = String.split(line, ",")
      if HashDict.has_key? hd, room do
        lst = HashDict.get hd, room
      else
        lst = []
      end
      HashDict.put hd, room, [course|lst]
    end)

    hd
  end
end
