### Follow these step:

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
      summary: create pet
      tags:
        - Pets
      parameters: []
      responses:
        "201":
          description: pet created
        "422":
          description: invalid request
        "200":
          description: successful
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
    get:
      summary: list pets
      responses:
        "200":
          description: successful
  "/api/v1/pets/{id}":
    get:
      summary: show pet
      tags:
        - Pets
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: string
      responses:
        "200":
          description: successful
        "404":
          description: pet not found
    parameters:
      - name: id
        in: path
        description: id
        required: true
        schema:
          type: string
    patch:
      summary: update pet
      responses:
        "200":
          description: successful

    put:
      summary: update pet
      tags:
        - Pets
      parameters:
        - name: id
          in: path
          description: ID of the pet to be updated
          required: true
          schema:
            type: string
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                pet:
                  type: object
                  properties:
                    name:
                      type: string
                    status:
                      type: string
                  required:
                    - name
                    - status
      responses:
        "200":
          description: successful

    delete:
      summary: delete pet
      responses:
        "200":
          description: successful
servers:
  - url: http://{defaultHost}
    variables:
      defaultHost:
        default: localhost:3000
        
```