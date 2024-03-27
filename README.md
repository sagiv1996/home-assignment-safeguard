# safeguard_home_assignment

A Flutter app that gives the user accurate current weather in a desirable location.
The project was carried out as part of a home assignment for the safeGuard company.

## Getting Started

In order to run the code make sure you have an updated version of Flutter.

### Steps:

1. Clone the project from GitHub:
   ```
   git clone https://github.com/sagiv1996/home-assignment-safeguard
   ```
2. cd to project.
3. Create a .env file with key from openweathermap[https://openweathermap.org/api]:
   ```
   API_KEY=<"YOUR_API_KEY">
   ```
4. Run the project.

#### Libraries used in the project:

1. go_router - Creating paths in code.
2. geolocator - for the purpose of obtaining the user's location.
3. weather - For loading and using data from openweathermap.
4. intl - For a more beautiful presentation of times and dates.
5. provider - For state management.
6. weather_animation - For a custom animated weather widget.
7. flutter_dotenv - for loading keys from an .env file.
8. flutter_map - For the purpose of creating a map that allows the user to select a location.
9. latlong2 - In order to create a latLong object, it is required to work with flutter_map.

#### The file architecture

1. providers - A folder containing all the provider files that exist with their interfaces.
2. view - A folder containing all the files related to visualization in the code.
   1. pages: The folder contains all the pages that exist in the application.
      1. home_page: Home screen, displays weather data in current location.
      2. search_page - A page containing the world map, when you select a place on the map, the system shows the weather in the selected place on the home_page.
      3. static_page - displays constant data.
   2. components:
      1. home_page_body - The component contains weather information.
      2. home_page_footer - Contains the footer of the page.
      3. error_page - Custom error messages for the following situations:
         1. The GPS is not available.
         2. Location permission denied.
         3. Unknown error.
         4. loading_page - Loading indicator page.
3. main - Definition of all the routes and use of the providers.

#### concluding words

I really enjoyed developing the app. I learned a lot during its development stages. I think if the product was a real product I would consider using with the Google map and I would also consider implementing a Google Places service for a search option.
I chose not to use the products that are economical.

### Images and video from project

##### Video (click to open):

<a href="https://youtube.com/shorts/-l3cnhUGqAs?si=1l7DlJ1x0wDIv8Y_"><img src="https://i.ibb.co/prscWKH/Screenshot-2024-03-22-16-25-37-59-1d9c79188dde1928ee834e5fff192f36.jpg" width='150' /></a>

##### Pictures of error types:

<img src='https://i.ibb.co/NxFJ4Sr/Screenshot-2024-03-22-15-59-09-42-1d9c79188dde1928ee834e5fff192f36.jpg' width='150'>
<img src='https://i.ibb.co/qJ8Lkzb/Screenshot-2024-03-22-15-56-58-14-1d9c79188dde1928ee834e5fff192f36.jpg' width='150'>
<img src='https://i.ibb.co/nwtNBQw/Screenshot-2024-03-22-15-55-07-79-1d9c79188dde1928ee834e5fff192f36.jpg' width='150'>
