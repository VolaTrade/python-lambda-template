# Python Lambda Template

Volatrade's opinionated Python3 lambda template

## Usage
When using this template to create your own lambda, follow the following steps to ensure you dont break stuff

1. Make sure you can run unit tests via `make test`, if not something is wrong with your environment

1. Go into `severless.yml` and change the value of `service` to the desired service name

1. Upon pushing your initial commit, go to our [circleci dashboard](https://app.circleci.com/projects/project-dashboard/github/VolaTrade/) and set up your new project

1. Add required environment variables to your circleci project, ensure they match with the variables specified in your `serverless.yml`
