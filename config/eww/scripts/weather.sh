#!/bin/bash

# -- Code inspired by adi1090x on github!

## Collect data
cache_dir="$HOME/.cache/eww/weather"
cache_weather_stat=${cache_dir}/weather-stat
cache_weather_degree=${cache_dir}/weather-degree
cache_weather_quote=${cache_dir}/weather-quote
cache_weather_hex=${cache_dir}/weather-hex
cache_weather_icon=${cache_dir}/weather-icon

## PIRATE WEATHER API DATA & KEYS! --------- INPUT YOUR DETAILS FROM pirateweather.net!!!
. $HOME/code/secrets
UNIT="us"  # Available options :'metric' or 'imperial'

## --------------------------------------------------------------------------------

## Make cache dir
if [ ! -d "$cache_dir" ]; then
  mkdir -p ${cache_dir}
fi

## Get data
get_weather_data() {
  weather=$(curl -sf "https://api.pirateweather.net/forecast/$API_KEY/$LOCATION")
  echo ${weather}

  if [ ! -z "$weather" ]; then
    weather_temp=$(echo "$weather" | jq -r ".currently.temperature")
    weather_icon_code=$(echo "$weather" | jq -r ".currently.icon")
    weather_description=$(echo "$weather" | jq -r ".currently.summary")

    # Map Pirate Weather API icon codes to your existing icons
    case $weather_icon_code in
      "clear-day")
        weather_icon=" "
        weather_quote="It's a sunny day, gonna be fun! \nDon't go wandering all by yourself though..."
        weather_hex="#ffd86b"
        ;;
      "clear-night")
        weather_icon=" "
        weather_quote="It's a clear night \nYou might want to take a evening stroll to relax..."
        weather_hex="#fcdcf6"
        ;;
      "rain")
        weather_icon=" "
        weather_quote="It's rainy, it's a great day! \nGet some ramen and watch as the rain falls..."
        weather_hex="#6b95ff"
        ;;
      "snow")
        weather_icon=" "
        weather_quote="It's gonna snow today \nYou'd better wear thick clothes and make a snowman as well!"
        weather_hex="#e3e6fc"
        ;;
      "sleet")
        weather_icon=""
        weather_quote="There's storm for forecast today \nMake sure you don't get blown away..."
        weather_hex="#ffeb57"
        ;;
      "wind")
        weather_icon=""
        weather_quote="It's windy today \nMake sure you hold onto your hat..."
        weather_hex="#ffeb57"
        ;;
      "fog")
        weather_icon=" "
        weather_quote="Forecast says it's misty \nMake sure you don't get lost on your way..."
        weather_hex="#84afdb"
        ;;
      "cloudy")
        weather_icon=" "
        weather_quote="It's  cloudy, sort of gloomy \nYou'd better get a book to read..."
        weather_hex="#adadff"
        ;;
      *)
        weather_icon=" "
        weather_quote="Sort of odd, I don't know what to forecast \nMake sure you have a good time!"
        weather_hex="#adadff"
        ;;
    esac

    echo "$weather_icon" >  ${cache_weather_icon}
    echo "$weather_description" > ${cache_weather_stat}
    echo "$weather_temp""°F" > ${cache_weather_degree}
    echo -e "$weather_quote" > ${cache_weather_quote}
    echo "$weather_hex" > ${cache_weather_hex}
  else
    echo "Weather Unavailable" > ${cache_weather_stat}
    echo " " > ${cache_weather_icon}
    echo -e "Ah well, no weather huh? \nEven if there's no weather, it's gonna be a great day!" > ${cache_weather_quote}
    echo "-" > ${cache_weather_degree}
    echo "#adadff" > ${cache_weather_hex}
  fi
}

## Execute
if [[ "$1" == "--getdata" ]]; then
  get_weather_data
elif [[ "$1" == "--icon" ]]; then
  cat ${cache_weather_icon}
elif [[ "$1" == "--temp" ]]; then
  cat ${cache_weather_degree}
elif [[ "$1" == "--hex" ]]; then
  cat ${cache_weather_hex}
elif [[ "$1" == "--stat" ]]; then
  cat ${cache_weather_stat}
elif [[ "$1" == "--quote" ]]; then
  cat ${cache_weather_quote} | head -n1
elif [[ "$1" == "--quote2" ]]; then
  cat ${cache_weather_quote} | tail -n1
fi
