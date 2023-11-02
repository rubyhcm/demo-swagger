###Follow these step:

#### Add to Gemfile

gem 'rspec-rails'
gem 'rswag'

#### Run

rails g rspec:install
rails g rswag:install

#### Run to generate the Swagger JSON file(s)

rake rswag:specs:swaggerize

#### Start

rails s and result at http://localhost:3000/api-docs/index.html

#### You can add more http request at swagger.yaml such as:

```ruby
---
openapi: 3.0.1
info:
  title: API V1
  version: v1
paths:
  "/api/v1/pets":
    post:
      summary: Creates a pet
      tags:
      - Pets
      parameters: []
      responses:
        '201':
          description: pet created
        '422':
          description: invalid request
      requestBody:
        content:
          application/json:
            schema:
              type: object
              properties:
                name:
                  type: string
                photo_url:
                  type: string
                status:
                  type: string
              required:
              - name
              - status
          application/xml:
            schema:
              type: object
              properties:
                name:
                  type: string
                photo_url:
                  type: string
                status:
                  type: string
              required:
              - name
              - status
  "/api/v1/pets/{id}":
    get:
      summary: Retrieves a pet
      tags:
      - Pets
      parameters:
      - name: id
        in: path
        required: true
        schema:
          type: string
      responses:
        '200':
          description: name found
          content:
            application/json:
              schema:
                type: object
                properties:
                  id:
                    type: integer
                  name:
                    type: string
                  photo_url:
                    type: string
                  status:
                    type: string
                required:
                - id
                - name
                - status
            application/xml:
              schema:
                type: object
                properties:
                  id:
                    type: integer
                  name:
                    type: string
                  photo_url:
                    type: string
                  status:
                    type: string
                required:
                - id
                - name
                - status
servers:
- url: http://{defaultHost}
  variables:
    defaultHost:
      default: localhost:3000

```
