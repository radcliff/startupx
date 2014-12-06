# StartupX

## Scenario:

Starbux wants to figure out a whole bunch of new coffee shops to open as they move into this new country, say Xmenistan. For that they decide to utilize Fivesquare foot traffic data to figure the highest density areas at certain times. Luckily StartupX has built a service for that. It will 
* get a feed from FiveSquare for user traffic and provide an API for the Starbux, so that they can 
* send in a list of geographical coordinates, a radius around them, and the service can 
* return a list of results (paged) for a given day/week/month in units of hours where the data is in number of people in the area/hour/location in that radius. 

**The Fivesquare data will come in the form of:**

```
[
 { 
    user_id: "some uid", 
    location_history: [
      { 
          datetime: "Time string with time zone",
          location: [ lon, lat ],
      },
      ...
    ]
 },
 { 
    user_id: "another uid",
    ...
  }
 ...
]
```

## Challenge:

* parse the incoming data (assuming it is received everyday from some API that is not important)
* create a schema based on the application we outlined to store it.
* create a RESTful API to retrieve it -> design the serialized format, what the API is called, what parameters are passed, and page the results.
 
* **BONUS:** how to do a push based solution, instead of the API being polled.

