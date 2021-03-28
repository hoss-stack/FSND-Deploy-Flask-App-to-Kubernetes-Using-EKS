# Deploying a Flask API

This is the project for the fourth course in the [Udacity Full Stack Nanodegree](https://www.udacity.com/course/full-stack-web-developer-nanodegree--nd004): Server Deployment, Containerization, and Testing.

In this project I got to containerize and deploy a Flask API to a Kubernetes cluster using Docker, AWS EKS, CodePipeline, and CodeBuild.

The Flask app that will be used for this project consists of a simple API with three endpoints:

- `GET '/'`: This is a simple health check, which returns the response 'Healthy'. 
- `POST '/auth'`: This takes a email and password as json arguments and returns a JWT based on a custom secret.
- `GET '/contents'`: This requires a valid JWT, and returns the un-encrpyted contents of that token. 

The app relies on a secret set in AWS parameter storage `JWT_SECRET` to produce a JWT.  server when deploying the app.

## App AWS Link
[APP Link](http://a23d688b712e34eb0acb8c714349368d-724985111.eu-west-1.elb.amazonaws.com)

## Dependencies

- Docker Engine
    - Installation instructions for all OSes can be found [here](https://docs.docker.com/install/).
    - For Mac users, if you have no previous Docker Toolbox installation, you can install Docker Desktop for Mac. If you already have a Docker Toolbox installation, please read [this](https://docs.docker.com/docker-for-mac/docker-toolbox/) before installing.
 - AWS Account
     - You can create an AWS account by signing up [here](https://aws.amazon.com/#).
     
## API Reference
### Endpoints

#### GET /

- General: 
  - Returns the response 'Healthy'.

- Sample:  `curl a23d688b712e34eb0acb8c714349368d-724985111.eu-west-1.elb.amazonaws.com`

```json
"Healthy"
```

#### POST /auth

- General:
  - Returns a JWT based on a custom secret and input email and password.

- Sample: `curl -d '{"email":"<EMAIL>","password":"<PASSWORD>"}' -H "Content-Type: application/json" -X POST a23d688b712e34eb0acb8c714349368d-724985111.eu-west-1.elb.amazonaws.com/auth`

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTgxNjI5OTMsIm5iZiI6MTYxNjk1MzM5MywiZW1haWwiOiI8RU1BSUw-In0.Y5efd6c0M93FYbrw03Pixn4tNWj4NMENdBTcotCeoxE"
}
```

#### GET /

- General: 
  - Returns the un-encrpyted contents of the given token.

- Sample:  `curl --request GET 'a23d688b712e34eb0acb8c714349368d-724985111.eu-west-1.elb.amazonaws.com/contents' -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTgxNjI5OTMsIm5iZiI6MTYxNjk1MzM5MywiZW1haWwiOiI8RU1BSUw-In0.Y5efd6c0M93FYbrw03Pixn4tNWj4NMENdBTcotCeoxE"`

```json
{
    "email":"<EMAIL>",
    "exp":1618162489,"nbf":1616952889
}
```

## Authors
- Hossam Reda created the APIs and tests
- Udacity full stack web developer nanodegree team started the project
