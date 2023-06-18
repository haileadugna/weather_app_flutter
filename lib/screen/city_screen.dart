import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  List<String> filteredCountries = [];

  final List<String> allCountries = [
    // List of all countries
    // Add more countries here
      "Addis Ababa",
  "Dire Dawa",
  "Mekelle",
  "Gondar",
  "Bahir Dar",
  "Awasa",
  "Dessie",
  "Jimma",
  "Adama",
  "Hawassa",
  "Axum",
  "Harar",
  "Nekemte",
  "Debre Markos",
  "Jijiga",
  "Shashamane",
  "Sodo",
  "Arba Minch",
  "Gambela",
  "Bishoftu",
  "Hosaena",
  "Asella",
  "Debre Birhan",
  "Wolaita Sodo",
  "Dila",
  "Kombolcha",
  "Shire",
  "Hagere Maryam",
  "Robe",
  "Yirga Alem",
  "Woldiya",
  "Ambo",
  "Bonga",
  "Guraghe",
  "Butajira",
  "Sebeta",
  "Dembi Dolo",
  "Metu",
  "Mizan Teferi",
  "Negele Borana",
  "Gedo",
  "Agaro",
  "Mendi",
  "Dabat",
  "Asosa",
  "Bedele",
  "Deder",
  "Dolo Odo",
  "Yabelo",
  "Gimbi",
  "Dodola",
  "Sebeta Hawas",
  "Mota",
  "Ziway",
  "Goba",
  "Finote Selam",
  "Boditi",
  "Kibre Mengist",
  "Gode",
  "Moyale",
  "Alem Tena",
  "Moyale",
  "Soddo",
  "Korem",
  "Kemise",
  "Gewane",
  "Gebre Guracha",
  "Ajebo",
  "Bedesa",
  "Kemise",
  "Bure",
  "Hirna",
  "Adigrat",
  "Areka",
  "Zeway",
  "Yirga Chefe",
  "Gore",
  "Chagni",
  "Ginir",
  "Bati",
  "Gelemso",
  "Mek'ele",
  "Lalibela",
  "Delgi",
  "Hamer",
  "Shire Inda Selassie",
  "Shashemene",
  "Nefas Silk",
  "Tepi",
  "Sodo",
  "Arba Minch",
  "Bonga",
  "Guraghe",
  "Butajira",
  "Sebeta",
  "Dembi Dolo",
  "Metu",
  "Mizan Teferi",
  "Negele Borana",
  "Gedo",
  "Agaro",
  "Mendi",
  "Dabat",
  "Asosa",
  "Bedele",
  "Deder",
  "Dolo Odo",
  "Yabelo",
  "Gimbi",
  "Dodola",
  "Sebeta Hawas",
  "Mota",
  "Ziway",
  "Goba",
  "Finote Selam",
  "Boditi",
  "Kibre Mengist",
  "Gode",
  "Moyale",
  "Alem Tena",
  "Moyale",
  "Soddo",
  "Korem",
  "Kemise",
    'Afghanistan',
'Albania',
'Algeria',
'Andorra',
'Angola',
'Antigua and Barbuda',
'Argentina',
'Armenia',
'Australia',
'Austria',
'Azerbaijan',
'Bahamas',
'Bahrain',
'Bangladesh',
'Barbados',
'Belarus',
'Belgium',
'Belize',
'Benin',
'Bhutan',
'Bolivia',
'Bosnia and Herzegovina',
'Botswana',
'Brazil',
'Brunei',
'Bulgaria',
'Burkina Faso',
'Burundi',
'Cabo Verde',
'Cambodia',
'Cameroon',
'Canada',
'Central African Republic',
'Chad',
'Chile',
'China',
'Colombia',
'Comoros',
'Congo',
'Costa Rica',
'Croatia',
'Cuba',
'Cyprus',
'Czech Republic',
'Democratic Republic of the Congo',
'Denmark',
'Djibouti',
'Dominica',
'Dominican Republic',
'East Timor',
'Ecuador',
'Egypt',
'El Salvador',
'Equatorial Guinea',
'Eritrea',
'Estonia',
'Eswatini',
'Ethiopia',
'Fiji',
'Finland',
'France',
'Gabon',
'Gambia',
'Georgia',
'Germany',
'Ghana',
'Greece',
'Grenada',
'Guatemala',
'Guinea',
'Guinea-Bissau',
'Guyana',
'Haiti',
'Honduras',
'Hungary',
'Iceland',
'India',
'Indonesia',
'Iran',
'Iraq',
'Ireland',
'Israel',
'Italy',
'Jamaica',
'Japan',
'Jordan',
'Kazakhstan',
'Kenya',
'Kiribati',
'Korea, North',
'Korea, South',
'Kosovo',
'Kuwait',
'Kyrgyzstan',
'Laos',
'Latvia',
'Lebanon',
'Lesotho',
'Liberia',
'Libya',
'Liechtenstein',
'Lithuania',
'Luxembourg',
'Madagascar',
'Malawi',
'Malaysia',
'Maldives',
'Mali',
'Malta',
'Marshall Islands',
'Mauritania',
'Mauritius',
'Mexico',
'Micronesia',
'Moldova',
'Monaco',
'Mongolia',
'Montenegro',
'Morocco',
'Mozambique',
'Myanmar',
'Namibia',
'Nauru',
'Nepal',
'Netherlands',
'New Zealand',
'Nicaragua',
'Niger',
'Nigeria',
'North Macedonia',
'Norway',
'Oman',
'Pakistan',
'Palau',
'Palestine',
'Panama',
'Papua New Guinea',
'Paraguay',
'Peru',
'Philippines',
'Poland',
'Portugal',
'Qatar',
'Romania',
'Russia',
'Rwanda',
'Saint Kitts and Nevis',
'Saint Lucia',
'Saint Vincent and the Grenadines',
'Samoa',
'San Marino',
'Sao Tome and Principe',
'Saudi Arabia',
'Senegal',
'Serbia',
'Seychelles',
'Sierra Leone',
'Singapore',
'Slovakia',
'Slovenia',
'Solomon Islands',
'Somalia',
'South Africa',
'South Sudan',
'Spain',
'Sri Lanka',
'Sudan',
'Suriname',
'Sweden',
'Switzerland',
'Syria',
'Taiwan',
'Tajikistan',
'Tanzania',
'Thailand',
'Togo',
'Tonga',
'Trinidad and Tobago',
'Tunisia',
'Turkey',
'Turkmenistan',
'Tuvalu',
'Uganda',
'Ukraine',
'United Arab Emirates',
'United Kingdom',
'United States',
'Uruguay',
'Uzbekistan',
'Vanuatu',
'Vatican City',
'Venezuela',
'Vietnam',
'Yemen',
'Zambia',
'Zimbabwe'

  ];

  void filterCountries(String searchText) {
    setState(() {
      filteredCountries = allCountries
          .where((country) => country.toLowerCase().startsWith(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Locations")),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    hintText: 'Enter city name',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.near_me),
                      onPressed: () {
                        Navigator.pop(context, cityName);
                      },
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      cityName = value;
                      filterCountries(value);
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredCountries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          cityName = filteredCountries[index];
                        });
                        Navigator.pop(context, cityName);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        child: Text(
                          filteredCountries[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.green[50],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
