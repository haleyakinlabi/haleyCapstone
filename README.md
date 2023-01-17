# MyPet API

## Haley's Capstone

## API

### User(s) (noun / resource / URL)

SEE: https://github.com/Gokul595/api_guard

- Sign Up (user.create)

    ```sh
    curl -v -X POST -H "Content-Type: application/json" -d '{"username": "chance", "email":"chance@example.com","password":"password","password_confirmation":"password"}' http://localhost:3000/users/sign_up
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
    curl -v -X POST -H "Content-Type: application/json" -d '{"email":"chance@example.com","password":"password"}' http://localhost:3000/users/sign_in
    curl -v -X POST -H "Content-Type: application/json" -d '{"email":"chance@example.com","password":"password"}' https://haley-capstone.fly.dev/users/sign_in
    ```

    /users/sign_in (routes map this URL to authentication.create)
                                                 |         |
                                                 |-noun    |-verb
    authentication / sign_in (noun)
    create (verb)

- Sign Out

    ```sh
    curl -v -X POST -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -d '{"email":"chance@example.com","password":"password"}' http://localhost:3000/users/sign_in
    curl -v -X POST -H "Authorization: Bearer ACCESS_TOKEN" -H "Content-Type: application/json" -d '{"email":"chance@example.com","password":"password"}' https://haley-capstone.fly.dev/users/sign_in
    ```

### Post(s) (noun / resources / URL)

- Paginated Feed (requires authentication)

    ```sh
    curl -v -H "Authorization: Bearer $ACCESS_TOKEN" http://localhost:3000/posts
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

### Users(s) (noun / resources / URL)

- Paginated Feed (requires authentication)

    ```sh
    curl -v -H "Authorization: Bearer $ACCESS_TOKEN" http://localhost:3000/users
    curl -v -H "Authorization: Bearer ACCESS_TOKEN" https://haley-capstone.fly.dev/users
    ```

  Filters

  - `feed=[*leaders,everyone]` The feed to access (defaults to leaders)
  - `username=QUERY` The username filter _(supports partial matches)_
  - `species=QUERY` The species filter _(supports partial matches)_
  - `breed=QUERY` The breed filter _(supports partial matches)_

  Examples

    ```sh
    curl -v -H "Authorization: Bearer ACCESS_TOKEN" https://haley-capstone.fly.dev/users?feed=everyone
    curl -v -H "Authorization: Bearer ACCESS_TOKEN" https://haley-capstone.fly.dev/users?species=dog
    curl -v -H "Authorization: Bearer ACCESS_TOKEN" https://haley-capstone.fly.dev/users?species=dog&breed=retriever
    ```

### Followersihp(s) (noun / resources / URL)

- Create (requires authentication)

    ```sh
    curl -v -X POST -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -d '{"leader_id":123}' http://localhost:3000/followerships
    curl -v -X POST -H "Authorization: Bearer ACCESS_TOKEN" -H "Content-Type: application/json" -d '{"leader_id":123}' https://haley-capstone.fly.dev/followerships
    ```

- Delete (requires authentication)

    ```sh
    curl -v -X DELETE -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" http://localhost:3000/followerships/LEADER_ID
    curl -v -X DELETE -H "Authorization: Bearer ACCESS_TOKEN" -H "Content-Type: application/json" https://haley-capstone.fly.dev/followerships/LEADER_ID
    ```

## Hosted PostgreSQL

https://neon.tech

<img width="707" alt="Untitled 2 2023-01-12 19-35-53" src="https://user-images.githubusercontent.com/32920/212224148-76450dc7-d1b8-4bca-9342-0e41c4809f5e.png">
