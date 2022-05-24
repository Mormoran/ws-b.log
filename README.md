# ws-b.log

This project serves to demonstrate knowledge gained through the completion of the [O'Reilly Ruby on Rails Tutorial 6th Edition](https://learning.oreilly.com/videos/ruby-on-rails/9780136733461/).

The design document stated as follows:

## Rails Views
* You should have a simple Index, create and delete views for Blog Posts - &#9745;
* Posts show view should include the list view of Comments associated to the Posts - &#9745;
* Posts show should include create form for Comments - &#9745;
* Comments should have a destroy button to permanently destroy a record - &#9745;

## REST API Endpoints
* Posts should be retrievable using API endpoint (Index and single Post record) - &#9745;
* Posts can be created using an API endpoint once all relevant parameters are
passed - &#9745;
* Posts can be deleted using an API endpoint - &#9745;
* Comments can created using API endpoint - &#9745;
* Single Post should return all associated comments as part of the serialised
response - &#9745;
* Comments can be deleted using an API call - &#9745;

# Project outcome
## Shortcomings

* Added Edit capability for articles even though it was not specified on design doc
* No authentication
* No user accounts
* No validation for posting (anyone can post)
* No authentication for API (anyone can do anything with API)
* No bootstrap for front

## Nice to haves:

* Admin interface for posting
* Restricting new posts to admins only
* User profiles
* Avatars for comments (comments are anonymous at the moment)
* Better front end

## Get started

Clone the repository and `cd` into the directory:

```cli
$ git clone https://github.com/Mormoran/ws-b.log.git
$ cd ws-b.log
```

Then install the needed gems (while skipping any Ruby gems needed only in production, this is only a demo project and a production deploy is not in the scope):

```cli
$ bundle config set --local without 'production'
$ bundle install
```

Next, migrate the database:

```cli
$ rails db:migrate
```

You are ready to run the app in a local server:

```cli
$ rails server
```

Navigate to `localhost:3000` to start using the app in local mode.

# Article API endpoints:
## GET

* URL: `/api/v1/articles`
* Params: None
* Success response code: 200
* Returns:
```json
[
  {
    "id": "<article_id :: integer>",
    "created_at": "<article.created_at :: datetime -> string>",
    "updated_at": "<article.updated_at :: datetime -> string>",
    "title": "<article.title :: string>",
    "description": "<article.description :: string>",
    "views": "<article.views :: integer>",
    "comments": [
      {
        "id": "<comment_id :: integer>",
        "created_at": "<comment.created_at :: datetime -> string>",
        "updated_at": "<comment.updated_at :: datetime -> string>",
        "content": "<comment.content :: string>"
      }
    ]
  }
]
```

* URL: `/api/v1/articles/:id`
* Params: None
* Success response code: 200
* Returns:
```json
{
  "id": "<article_id :: integer>",
  "created_at": "<article.created_at :: datetime -> string>",
  "updated_at": "<article.updated_at :: datetime -> string>",
  "title": "<article.title :: string>",
  "description": "<article.description :: string>",
  "views": "<article.views :: integer>",
  "comments": [
    {
      "id": "<comment_id :: integer>",
      "created_at": "<comment.created_at :: datetime -> string>",
      "updated_at": "<comment.updated_at :: datetime -> string>",
      "content": "<comment.content :: string>"
    }
  ]
}
```

## POST

* URL: `/api/v1/articles`
* Params:
```json
{
  "title": "<string>",
  "description": "<string>",
}
```
* Success response code: 201
* Returns:
```json
{
  "id": "<article_id :: integer>",
  "created_at": "<article.created_at :: datetime -> string>",
  "updated_at": "<article.updated_at :: datetime -> string>",
  "title": "<article.title :: string>",
  "description": "<article.description :: string>",
  "views": "<article.views :: integer>",
  "comments": []
}
```

* Error response code: 400
* Returns:
```json
{
  "error": "Unable to create Article."
}
```

## PUT

* URL: `/api/v1/articles/:id`
* Params:
```json
{
  "title": "<string>", # Optional
  "description": "<string>", # Optional
}
```
* Success response code: 200
* Returns:
```json
{
  "message": "Article successfully updated. "
}
```

* Error response code: 400
* Returns:
```json
{
  "error": "Unable to update Article."
}
```

## DELETE

* URL: `/api/v1/articles/:id`
* Params: None
* Success response code: 200
* Returns:
```json
{
  "message": "Article successfully deleted. "
}
```

* Error response code: 400
* Returns:
```json
{
  "error": "Unable to delete Article."
}
```

# Comments API endpoints:

## GET

* URL: `/api/v1/articles/:article_id/comments`
* Params: None
* Success response code: 200
* Returns:
```json
[
  {
    "id": "<comment_id :: integer>",
    "created_at": "<comment.created_at :: datetime -> string>",
    "updated_at": "<comment.updated_at :: datetime -> string>",
    "content": "<comment.content :: string>"
  },
  {
    "id": "<comment_id :: integer>",
    "created_at": "<comment.created_at :: datetime -> string>",
    "updated_at": "<comment.updated_at :: datetime -> string>",
    "content": "<comment.content :: string>"
  }
]
```

* URL: `/api/v1/articles/:article_id/comments/:id`
* Params: None
* Success response code: 200
* Returns:
```json
{
  "id": "<comment_id :: integer>",
  "created_at": "<comment.created_at :: datetime -> string>",
  "updated_at": "<comment.updated_at :: datetime -> string>",
  "content": "<comment.content :: string>"
}
```

## POST

* URL: `/api/v1/articles/:article_id/comments`
* Params:
```json
{
  "content": "<string>"
}
```
* Success response code: 201
* Returns:
```json
{
  "id": "<comment_id :: integer>",
  "created_at": "<comment.created_at :: datetime -> string>",
  "updated_at": "<comment.updated_at :: datetime -> string>",
  "content": "<comment.content :: string>"
}
```

* Error response code: 400
* Returns:
```json
{
  "error": "Unable to create comment."
}
```

## DELETE

* URL: `/api/v1/articles/:article_id/comments/:id`
* Params: None
* Success response code: 200
* Returns:
```json
{
  "message": "Comment successfully deleted. "
}
```

* Error response code: 400
* Returns:
```json
{
  "error": "Unable to delete comment."
}
```
