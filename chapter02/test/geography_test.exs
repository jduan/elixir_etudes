defmodule GeographyTest do
  use ExUnit.Case

  test "make_geo_list" do
    input_str = """
    Germany,German
    Hamburg,1739117,53.57532,10.01534
    Frankfurt am Main,650000,50.11552,8.68417
    Dresden,486854,51.05089,13.73832
    Spain,Spanish
    Madrid,3255944,40.4165,-3.70256
    Granada,234325,37.18817,-3.60667
    Barcelona,1621537,41.38879,2.15899
    South Korea,Korean
    Seoul,10349312,37.56826,126.97783
    Busan,3678555,35.10278,129.04028
    Daegu,2566540,35.87028,128.59111
    Peru,Spanish
    Lima,7737002,-12.04318,-77.02824
    Cusco,312140,-13.52264,-71.96734
    Arequipa,841130,-16.39889,-71.535
    """
    expected_country_list = [
      %Country{cities: [
          %City{latitude: -16.39889, longitude: -71.535, name: "Arequipa", population: 841130},
          %City{latitude: -13.52264, longitude: -71.96734, name: "Cusco", population: 312140},
          %City{latitude: -12.04318, longitude: -77.02824, name: "Lima", population: 7737002},
        ], language: "Spanish", name: "Peru"},
      %Country{cities: [
          %City{latitude: 35.87028, longitude: 128.59111, name: "Daegu", population: 2566540},
          %City{latitude: 35.10278, longitude: 129.04028, name: "Busan", population: 3678555},
          %City{latitude: 37.56826, longitude: 126.97783, name: "Seoul", population: 10349312},
        ], language: "Korean", name: "South Korea"},
      %Country{cities: [
          %City{latitude: 41.38879, longitude: 2.15899, name: "Barcelona", population: 1621537},
          %City{latitude: 37.18817, longitude: -3.60667, name: "Granada", population: 234325},
          %City{latitude: 40.4165, longitude: -3.70256, name: "Madrid", population: 3255944},
        ], language: "Spanish", name: "Spain"},
      %Country{cities: [
          %City{latitude: 51.05089, longitude: 13.73832, name: "Dresden", population: 486854},
          %City{latitude: 50.11552, longitude: 8.68417, name: "Frankfurt am Main", population: 650000},
          %City{latitude: 53.57532, longitude: 10.01534, name: "Hamburg", population: 1739117},
        ], language: "German", name: "Germany"}
    ]
    country_list = Geography.make_geo_list_helper(input_str)
    assert country_list == expected_country_list

    total_population = Geography.total_population(country_list, "Korean")
    assert total_population == (2566540 + 3678555 + 10349312)
  end
end
