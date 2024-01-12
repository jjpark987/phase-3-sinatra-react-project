# Phase 3 Project: Travelogue

## Introduction

The Travelogue web application is designed to provide users with insights into various cities by sharing experiences and activities. It operates as a single-page application, utilizing the React framework on the frontend. The backend is powered by Active Record Object-Relational Mapping, which ensures efficient data management and connectivity to the database. It takes advantage of RESTful conventions to enable smooth communication between the client and server.

You can find more details about the frontend implementation [here](https://github.com/jjpark987/phase-3-project-frontend).

## Description

In order to encapsulate the data and functionality associated with cities and their respective posts, there are two models: City and Post. This domain model establishes a one-to-many relationahip between City and Post. In other words, a city can have multiple posts while each post belongs to a specific city.

During development, the databases for both models are seeded with generated entries using the [Faker gem](https://github.com/faker-ruby/faker).

### City Model

The City model represents a city entity with attributes such as name, country, population, and image. The City Model offers methods for creating a new city, retrieving city information, and deleting a city from the database.

### Post Model

The Post Model represents an individual post. It stores details about the post's title, category, body, and auto-generated timestamps to track when the post was created and last updated. This model contains full CRUD capablities, providing users with comprehensive control over the posts.

## Demo

[Video Walkthrough](https://youtu.be/YYjzs0jWxEg)

## Support

Please contact me at jjpark987@gmail.com for any questions.
