
<a name="readme-top"></a>
<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Sykogst/tea_subscription_api">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#gems">Gems</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#schema">Schema</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#improvements">Improvements</a></li>
    <li><a href="#endpoints">Endpoints</a></li>
    <li><a href="#contributors">Contributors</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
This is is a Rails API for a Tea Subscription Service providing various endpoints to be consumed by a frontend application. It displays an understanding of using Rails to set up an API using test driven development (TDD), the ability to create endpoints using restful routes, and demonstration of code organization following object oriented programming (OOP)


### Built With
* [![Ruby on Rails][Rails-shield]][Rails-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Gems

### Production
<!-- * [![faraday][gem-faraday]][gem-faraday-url] -->
* [![jsonapi-serializer][gem-jsonapi-serializer]][gem-jsonapi-serializer-url]

### Testing
* [![rspec-rails][gem-rspec-rails]][gem-rspec-rails-url]
* [![simplecov][gem-simplecov]][gem-simplecov-url]
* [![factory_bot_rails][gem-factory_bot_rails]][gem-factory_bot_rails-url]
* [![faker][gem-faker]][gem-faker-url]
* [![pry][gem-pry]][gem-pry-url]
* [![shoulda-matchers][gem-shoulda-matchers]][gem-shoulda-matchers-url]
* [![capybara][gem-capybara]][gem-capybara-url]
* [![webmock][gem-webmock]][gem-webmock-url]
* [![vcr][gem-vcr]][gem-vcr-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/Sykogst/tea_subscription_api.git
   ```
    ```
2. Gem Bundle
   ```sh
    bundle
   ```
3. Rake
   ```sh
    rails db:{drop,create,migrate,seed}
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Schema -->
## Schema
![Schema Image](images/schema.png)

![DB Diagram](images/dbdiagram.png)

### Design Decisions
- Subscriptions-Teas, one-to-one relationship over-one-to many
	1. Simplicity and intuitive
	2. Data retrieval is also more straight forward

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [ ] Endpoint to subscribe a customer to a tea subscription
    - [ ] `POST /subscriptions`
    - [ ] Create a new subscription for a specified customer, including a selected tea
- [ ] Endpoint to cancel a customer's tea subscription
    - [ ] `DELETE /subscriptions/:id`
    - [ ] Remove a specified subscription
- [ ] Endpoint to see all customer's subscriptions
    - [ ] `GET /customers/:customer_id/subscriptions`
    - [ ] Retrieve all subscriptions for a specified customer (active and cancelled) 

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Improvements -->
## Improvements
- [ ] POSSIBLE IMPROVEMENTS

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Endpoints

### Subscribe a Customer to a Tea Subscription
* **`POST api/v0/subscriptions`**
  - Example Request:
    ```
    POST /api/v0/subscriptions
    Content-Type: application/json
    Accept: application/json

    {
        "customer_id": 1,
        "subscription_id": 1
    }
    ```
  - Example Response:
    ```json
    {
        "data": {
            "id": "1",
            "type": "customer_subscription",
            "attributes": {
                "customer_id": 1,
                "subscription_id": 1
            },
            "relationships": {
                "customer": {
                    "data": {
                        "id": "1",
                        "type": "customer"
                    }
                },
                "subscription": {
                    "data": {
                        "id": "1",
                        "type": "subscription"
                    }
                }
            }
        }
    }
    ```

### Cancel a Customer's Tea Subscription
* **DELETE /api/v0/subscriptions/:id**
  - Example Request:
    ```
    DELETE /api/v0/subscriptions/:id
    Content-Type: application/json
    Accept: application/json

    {
      "id": 1,
    }
    ```
  - Example Response:
    ```json
    ```

### See all of a Customer's Subscriptions (active and cancelled)
* **GET /api/v0/customers/:customer_id/subscriptions**
  - Example Request:
    ```
    GET /api/v0/customers/:customer_id/subscriptions
    Content-Type: application/json
    Accept: application/json

    {
      "id": 1,
    }
    ```
  - Example Response:
    ```json
    {
        "data": {
            "type": "users",
            "id": "1",
            "attributes": {
                "subscriptions": [],
            }
        }
    }
    ```



## Contributors

Sam Tran 
 
[![LinkedIn][linkedin-shield]][linkedin-url-st]
[![GitHub][github-shield-st]][github-url-st]






<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/tea_subscription_api.svg?style=for-the-badge
[contributors-url]: https://github.com/tea_subscription_api/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/tea_subscription_api.svg?style=for-the-badge
[forks-url]: https://github.com/tea_subscription_api/network/members
[stars-shield]: https://img.shields.io/github/stars/tea_subscription_api.svg?style=for-the-badge
[stars-url]: https://github.com/tea_subscription_api/stargazers
[issues-shield]: https://img.shields.io/github/issues/tea_subscription_api.svg?style=for-the-badge
[issues-url]: https://github.com/tea_subscription_api/issues
[license-shield]: https://img.shields.io/github/license/tea_subscription_api.svg?style=for-the-badge
[license-url]: https://github.com/tea_subscription_api/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url-st]: https://www.linkedin.com/in/sam-t-tran

[product-screenshot]: images/screenshot.png

[Rails-shield]: https://img.shields.io/badge/Ruby%20on%20Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/
[HTML-shield]: https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white
[HTML-url]: https://developer.mozilla.org/en-US/docs/Web/HTML
[JavaScript-shield]: https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black
[JavaScript-url]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[PostgreSQL-shield]: https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSQL-url]: https://www.postgresql.org/

[gem-debug]: https://img.shields.io/badge/debug-1.9.1-brightgreen?style=flat-square
[gem-debug-url]: https://rubygems.org/gems/debug

[gem-rspec-rails]: https://img.shields.io/badge/rspec--rails-6.1.0-green?style=flat-square
[gem-rspec-rails-url]: https://github.com/rspec/rspec-rails

[gem-simplecov]: https://img.shields.io/badge/simplecov-0.22.0-yellow?style=flat-square
[gem-simplecov-url]: https://github.com/simplecov-ruby/simplecov

[gem-factory_bot_rails]: https://img.shields.io/badge/factory_bot_rails-6.4.0-success?style=flat-square
[gem-factory_bot_rails-url]: https://github.com/thoughtbot/factory_bot_rails

[gem-faker]: https://img.shields.io/badge/faker-3.2.2-red?style=flat-square
[gem-faker-url]: https://github.com/faker-ruby/faker

[gem-pry]: https://img.shields.io/badge/pry-0.14.2-yellow?style=flat-square
[gem-pry-url]: https://github.com/pry/pry

[gem-shoulda-matchers]: https://img.shields.io/badge/shoulda--matchers-6.0.0-orange?style=flat-square
[gem-shoulda-matchers-url]: https://github.com/thoughtbot/shoulda-matchers

[gem-faraday]: https://img.shields.io/badge/faraday-2.8.1-yellowgreen?style=flat-square
[gem-faraday-url]: https://github.com/lostisland/faraday

[gem-jsonapi-serializer]: https://img.shields.io/badge/jsonapi--serializer-2.2.0-blue?style=flat-square
[gem-jsonapi-serializer-url]: https://github.com/jsonapi-serializer/jsonapi-serializer

[gem-capybara]: https://img.shields.io/badge/capybara-3.39.2-brightgreen?style=flat-square
[gem-capybara-url]: https://github.com/teamcapybara/capybara

[gem-webmock]: https://img.shields.io/badge/webmock-3.19.1-yellowgreen?style=flat-square
[gem-webmock-url]: https://github.com/bblimke/webmock

[gem-vcr]: https://img.shields.io/badge/vcr-6.2.0-orange?style=flat-square
[gem-vcr-url]: https://github.com/vcr/vcr

[github-shield-st]: https://img.shields.io/badge/GitHub-Sykogst-success?style=for-the-badge&logo=github
[github-url-st]: https://github.com/Sykogst