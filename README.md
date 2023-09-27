# Sweater Weather ReadMe

Sweater Seather consumes simple data points from the front end in each request to return live weather, book, and map/routing data.  

This Api consumes 3 different Api's
  * MapQuestApi
  * WeatherApi
  * OpenLibraryApi


### Request Endpoint

`GET` `api/v0/forecast`

#### Response

<details closed>
<summary>Successful Response Body</summary>

```json
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "last_updated": "2023-09-27 09:45",
                "temperature": 64.0,
                "feels_like": 64.0,
                "humidity": 93,
                "uvi": 4.0,
                "visibility": 1.0,
                "condition": "Light rain",
                "icon": "//cdn.weatherapi.com/weather/64x64/day/296.png"
            },
            "daily_weather": [
                {
                    "date": "2023-09-27",
                    "sunrise": "07:30 AM",
                    "sunset": "07:27 PM",
                    "max_temp": 75.9,
                    "min_temp": 64.0,
                    "condition": "Moderate rain",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/302.png"
                },
                {
                    "date": "2023-09-28",
                    "sunrise": "07:31 AM",
                    "sunset": "07:26 PM",
                    "max_temp": 73.8,
                    "min_temp": 61.0,
                    "condition": "Heavy rain",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/308.png"
                },
                {
                    "date": "2023-09-29",
                    "sunrise": "07:32 AM",
                    "sunset": "07:24 PM",
                    "max_temp": 83.7,
                    "min_temp": 59.1,
                    "condition": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png"
                },
                {
                    "date": "2023-09-30",
                    "sunrise": "07:33 AM",
                    "sunset": "07:22 PM",
                    "max_temp": 85.8,
                    "min_temp": 61.0,
                    "condition": "Sunny",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
                },
                {
                    "date": "2023-10-01",
                    "sunrise": "07:34 AM",
                    "sunset": "07:21 PM",
                    "max_temp": 84.9,
                    "min_temp": 60.9,
                    "condition": "Sunny",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
                }
            ],
            "hourly_weather": [
                {
                    "time": "2023-09-27 00:00",
                    "temperature": 68.4,
                    "conditions": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png"
                },
                {
                    "time": "2023-09-27 01:00",
                    "temperature": 67.5,
                    "conditions": "Clear",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
                },
                {
                    "time": "2023-09-27 02:00",
                    "temperature": 66.7,
                    "conditions": "Clear",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
                },
                {
                    "time": "2023-09-27 03:00",
                    "temperature": 65.8,
                    "conditions": "Clear",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
                },
                {
                    "time": "2023-09-27 04:00",
                    "temperature": 65.1,
                    "conditions": "Clear",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
                },
                {
                    "time": "2023-09-27 05:00",
                    "temperature": 64.6,
                    "conditions": "Clear",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
                },
                {
                    "time": "2023-09-27 06:00",
                    "temperature": 64.0,
                    "conditions": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png"
                },
                {
                    "time": "2023-09-27 07:00",
                    "temperature": 64.0,
                    "conditions": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png"
                },
                {
                    "time": "2023-09-27 08:00",
                    "temperature": 64.9,
                    "conditions": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png"
                },
                {
                    "time": "2023-09-27 09:00",
                    "temperature": 64.0,
                    "conditions": "Light rain",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/296.png"
                },
                {
                    "time": "2023-09-27 10:00",
                    "temperature": 69.1,
                    "conditions": "Overcast",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/122.png"
                },
                {
                    "time": "2023-09-27 11:00",
                    "temperature": 68.7,
                    "conditions": "Moderate or heavy rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/356.png"
                },
                {
                    "time": "2023-09-27 12:00",
                    "temperature": 68.2,
                    "conditions": "Overcast",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/122.png"
                },
                {
                    "time": "2023-09-27 13:00",
                    "temperature": 70.7,
                    "conditions": "Overcast",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/122.png"
                },
                {
                    "time": "2023-09-27 14:00",
                    "temperature": 70.7,
                    "conditions": "Moderate or heavy rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/356.png"
                },
                {
                    "time": "2023-09-27 15:00",
                    "temperature": 75.0,
                    "conditions": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png"
                },
                {
                    "time": "2023-09-27 16:00",
                    "temperature": 75.2,
                    "conditions": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png"
                },
                {
                    "time": "2023-09-27 17:00",
                    "temperature": 75.9,
                    "conditions": "Moderate or heavy rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/356.png"
                },
                {
                    "time": "2023-09-27 18:00",
                    "temperature": 74.5,
                    "conditions": "Overcast",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/122.png"
                },
                {
                    "time": "2023-09-27 19:00",
                    "temperature": 73.4,
                    "conditions": "Overcast",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/122.png"
                },
                {
                    "time": "2023-09-27 20:00",
                    "temperature": 71.4,
                    "conditions": "Light rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png"
                },
                {
                    "time": "2023-09-27 21:00",
                    "temperature": 69.3,
                    "conditions": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png"
                },
                {
                    "time": "2023-09-27 22:00",
                    "temperature": 67.6,
                    "conditions": "Cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/119.png"
                },
                {
                    "time": "2023-09-27 23:00",
                    "temperature": 67.1,
                    "conditions": "Overcast",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/122.png"
                }
            ]
        }
    }
}
```

</details>

### Request Endpoint

`POST` `api/v0/users`

#### Response

<details closed>
<summary>Successful Response Body</summary>

```json
{
    "data": {
        "type": "users",
        "id": 1052,
        "attributes": {
            "email": "Ian@example.com",
            "api_key": "93d1dc116c339d7d977b24585706d557"
        }
    }
}
```

</details>

### Request Endpoint

`POST` `api/v0/sessions`

#### Response

<details closed>
<summary>Successful Response Body</summary>

```json
{
    "data": {
        "type": "users",
        "id": 1052,
        "attributes": {
            "email": "Ian@example.com",
            "api_key": "41412b3951ffa19a973e28512b161235"
        }
    }
}
```

</details>

### Request Endpoint

`POST` `api/v0/roadtrip`

#### Response

<details closed>
<summary>Successful Response Body</summary>

```json
{
    "data": {
        "id": null,
        "type": "road_trip",
        "attributes": {
            "start_city": "New York, NY",
            "end_city": "Los Angeles, CA",
            "travel_time": "38:54:17",
            "weather_at_eta": {
                "datetime": "2023-09-28 15:00",
                "temperature": 80.0,
                "condition": "Sunny"
            }
        }
    }
}
```

</details>

### Request Endpoint

`GET` `api/v1/book-search`

#### Response

<details closed>
<summary>Successful Response Body</summary>

```json
{
    "data": {
        "id": null,
        "type": "books",
        "attributes": {
            "destination": "Denver",
            "forecast": {
                "summary": "Partly cloudy",
                "temperature": "49 F"
            },
            "total_books_found": 3720,
            "books": [
                {
                    "isbn": [
                        "1885435711",
                        "9781885435712"
                    ],
                    "title": "Denver, Colorado"
                },
                {
                    "isbn": null,
                    "title": "The Children's Hospital of Denver, Denver, Colorado"
                },
                {
                    "isbn": null,
                    "title": "The Children's Hospital of Denver, Denver, Colorado"
                },
                {
                    "isbn": [
                        "0896864642",
                        "9780896864641"
                    ],
                    "title": "Denver, Colorado"
                },
                {
                    "isbn": null,
                    "title": "Denver, Colorado"
                }
            ]
        }
    }
}
```

</details>
