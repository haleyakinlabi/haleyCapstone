# MyPet API

## Haley's Capstone

## API

### User(s) (noun / resource / URL)

SEE: https://github.com/Gokul595/api_guard

- Sign Up (user.create)

    ```sh
    curl -v -X POST -H "Content-Type: application/json" -d '{"username": "chance", "email":"chance@example.com","password":"password","password_confirmation":"password"}' https://haley-capstone.fly.dev/users/sign_up
    ```

    /users/sign_up (routes map this URL to registration.create)
                                                 |         |
                                                 |-noun    |-verb
    ...
    registration / sign_up (noun)
    create (verb)

- Sign In

    ```sh
    curl -v -X POST -H "Content-Type: application/json" -d '{"email":"chance@example.com","password":"password"}' https://haley-capstone.fly.dev/users/sign_in
    ```

    /users/sign_in (routes map this URL to authentication.create)
                                                 |         |
                                                 |-noun    |-verb
    authentication / sign_in (noun)
    create (verb)

- Sign Out

    ```sh
    curl -v -X POST -H "Authorization: Bearer ACCESS_TOKEN" -H "Content-Type: application/json" -d '{"email":"chance@example.com","password":"password"}' https://haley-capstone.fly.dev/users/sign_in
    ```

### Post(s) (noun / resources / URL)

- Paginated Feed (requires authentication)

    ```sh
    curl -v -H "Authorization: Bearer ACCESS_TOKEN" https://haley-capstone.fly.dev/posts
    ```

  Filters

  - `feed=[*leaders,everyone]` The feed to access (defaults to leaders)
  - `username=QUERY` The username filter _(supports partial matches)_
  - `species=QUERY` The species filter _(supports partial matches)_
  - `breed=QUERY` The breed filter _(supports partial matches)_

  Examples

    ```sh
    curl -v -H "Authorization: Bearer ACCESS_TOKEN" https://haley-capstone.fly.dev/posts?feed=everyone
    curl -v -H "Authorization: Bearer ACCESS_TOKEN" https://haley-capstone.fly.dev/posts?species=dog
    curl -v -H "Authorization: Bearer ACCESS_TOKEN" https://haley-capstone.fly.dev/posts?species=dog&breed=retriever
    ```

## Hosted PostgreSQL

https://neon.tech

<img width="707" alt="Untitled 2 2023-01-12 19-35-53" src="https://user-images.githubusercontent.com/32920/212224148-76450dc7-d1b8-4bca-9342-0e41c4809f5e.png">
