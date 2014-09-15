defmodule Country do
  defstruct name: "", language: 0, cities: []
end

defmodule City do
  defstruct latitude: 0, longitude: 0, name: "", population: 0
end

defprotocol Valid do
  @doc "Return true if the data is considered valid"
  def valid?(data)
end

defimpl Valid, for: City do
  def valid?(%City{latitude: lat, longitude: lon, population: p}) do
    p >= 0 and lat in -90..90 and lon in -180..180
  end
end

defimpl Inspect, for: City do
  import Inspect.Algebra

  def inspect(%City{latitude: latitude, longitude: longitude, population:
    population, name: name}, _options) do
    lat = if (latitude < 0) do
      concat(to_string(Float.round(abs(latitude * 1.0), 2)), "°S")
    else
      concat(to_string(Float.round(latitude * 1.0, 2)), "°N")
    end

    lon = if (longitude < 0) do
      concat(to_string(Float.round(abs(longitude * 1.0), 2)), "°W")
    else
      concat(to_string(Float.round(longitude * 1.0, 2)), "°E")
    end

    concat([name, break,
      "(", to_string(population), ")", break,
      lat, break, lon])
  end
end

defmodule Geography do
  def make_geo_list(filename) do
    {:ok, content} = File.read(filename, [:read, :utf8])
    make_geo_list_helper(content)
  end

  def make_geo_list_helper(content) do
    lines = String.split(String.rstrip(content), "\n")
    process_lines(nil, lines, [])
  end

  def total_population(countries, language) do
    countries
    |> Enum.filter(fn country -> country.language == language end)
    |> Enum.reduce(0, fn country, acc ->
      acc + total_population_cities(country.cities)
    end)
  end

  def total_population_cities(cities) do
    cities
    |> Enum.reduce(0, fn city, acc ->
      acc + city.population
    end)
  end

  # no more lines
  defp process_lines(_country, [], countries) do
    countries
  end

  defp process_lines(country, lines, countries) do
    [head|tail] = lines
    case String.split(head, ",") do
      [name, language] ->
        country = %Country{name: name, language: language}
        process_lines(country, tail, [country | countries])
      [name, population, latitude, longitude] ->
        city = %City{
          latitude: String.to_float(latitude),
          longitude: String.to_float(longitude),
          name: name,
          population: String.to_integer(population)
        }
        cities = country.cities
        country = %Country{country | cities: [city|cities]}
        [_ | rest_countries] = countries
        countries = [country | rest_countries]
        process_lines(country, tail, countries)
    end
  end
end
