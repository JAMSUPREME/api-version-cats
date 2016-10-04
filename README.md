# How to use

## Create an owner

```
POST localhost:3005/owners

Body:
{ "name":"Tophat" }
```

## Create a cat

```
POST localhost:3005/cats

Body:
{ "name":"Whiskers", "age": 9, "owner_id": 1 }
```

## Retrieve cats in several ways via Accept

Retrieve a cat via `GET localhost:3005/cats/1`

Here are the Accept header options:
* application/json (default)
* application/vnd.myuscis.flat+json (flattened default)
* application/vnd.myuscis.v2+json (v2)
* application/vnd.myuscis.v2.flat+json (flattened v2)

## Unsupported media types return a 400

Attempting to retrieve with an Accept header of `application/vnd.myuscis.v3.flat+json` would result in a 400 Bad Request