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

# API article endpoints:
## GET

* URL: `/api/v1/articles`
* Params: None
* Returns:
```
[
  {
    "id": <article_id :: integer>,
    "created_at": "<article.created_at :: datetime -> string>",
    "updated_at": "<article.updated_at :: datetime -> string>",
    "title": "<article.title :: string>",
    "description": "<article.description :: string>",
    "views": <article.views :: integer>,
    "comments": [
      {
        "id": <comment_id :: integer>,
        "created_at": "<comment.created_at :: datetime -> string>",
        "updated_at": "<comment.updated_at :: datetime -> string>",
        "content": "<comment.content :: string>"
      },
      {
        ...
      }
    ]
  }
]
```

* URL: `/api/v1/articles/:id`
* Params: None
* Returns:
```
{
  "id": <article_id :: integer>,
  "created_at": "<article.created_at :: datetime -> string>",
  "updated_at": "<article.updated_at :: datetime -> string>",
  "title": "<article.title :: string>",
  "description": "<article.description :: string>",
  "views": <article.views :: integer>,
  "comments": [
    {
      "id": <comment_id :: integer>,
      "created_at": "<comment.created_at :: datetime -> string>",
      "updated_at": "<comment.updated_at :: datetime -> string>",
      "content": "<comment.content :: string>"
    },
    {
      ...
    }
  ]
}
```

## POST

* URL: `/api/v1/articles`
* Params:
```
{
  "title": "<string>",
  "description": "<string>",
}
```
* Returns:
```
{
  "id": <article_id :: integer>,
  "created_at": "<article.created_at :: datetime -> string>",
  "updated_at": "<article.updated_at :: datetime -> string>",
  "title": "<article.title :: string>",
  "description": "<article.description :: string>",
  "views": <article.views :: integer>,
  "comments": []
}
```

## PUT

* URL: `/api/v1/articles/:id`
* Params:
```
{
  "title": "<string>", # Optional
  "description": "<string>", # Optional
}
```
* Returns:
```
{
  "message": "Article successfully updated. "
}
```

## DELETE

* URL: `/api/v1/articles/:id`
* Params: None
* Returns:
```
{
  "message": "Article successfully deleted. "
}
```

# API comments endpoints:

## GET

* URL: `/api/v1/articles/:article_id/comments`
* Params: None
* Returns:
```
[
  {
    "id": <comment_id :: integer>,
    "created_at": "<comment.created_at :: datetime -> string>",
    "updated_at": "<comment.updated_at :: datetime -> string>",
    "content": "<comment.content :: string>"
  },
  {
    "id": <comment_id :: integer>,
    "created_at": "<comment.created_at :: datetime -> string>",
    "updated_at": "<comment.updated_at :: datetime -> string>",
    "content": "<comment.content :: string>"
  },
    ...
  }
]
```

* URL: `/api/v1/articles/:article_id/comments/:id`
* Params: None
* Returns:
```
{
  "id": <comment_id :: integer>,
  "created_at": "<comment.created_at :: datetime -> string>",
  "updated_at": "<comment.updated_at :: datetime -> string>",
  "content": "<comment.content :: string>"
}
```

## POST

* URL: `/api/v1/articles/:article_id/comments`
* Params:
```
{
  "content": "<string>"
}
```
* Returns:
```
{
  "id": <comment_id :: integer>,
  "created_at": "<comment.created_at :: datetime -> string>",
  "updated_at": "<comment.updated_at :: datetime -> string>",
  "content": "<comment.content :: string>"
}
```

## DELETE

* URL: `/api/v1/articles/:article_id/comments/:id`
* Params: None
* Returns:
```
{
  "message": "Comment successfully deleted. "
}
```
