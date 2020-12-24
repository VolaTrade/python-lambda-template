# Python Lambda Template

Volatrade's opinionated Python3 lambda template

To use this template, just make a new repository on github.com, click the "Use Template" button, name your new function and you're ready to go!

## Cron job setup steps
Need this function to run every n minutes, hours, days or weeks? Use the following steps to get started

1. First, check your `serverless.yml` and under `function.<function-name>.events` you can change the schedule to the interval you want the job to run on.
    > Any resource permissions that you'll need must be set within the iamRoleStatement

1. If you aren't running python3.7, install a python version manager such as [pyenv](https://github.com/pyenv/pyenv) 
    - You can create a python3.7 virtual environment using something like `pyenv virtualenv 3.7.9 <lambda-function-name>`
    - Then you can run `pyenv local <lambda-function-name>` to activate your virtual environment

1. If you have to query a postgres db, read the section below on using psycopg2, if not you can remove the `Dockerfile`

1. Make sure you update create_env.sh to look like below, where all private keys should be mapped from this to circleci . These environment variables should exist in circleci.

```
cat > .env << EOF
SECRET_PASSWORD=${SECRET_PASSWORD}
SUPER_SECRET_HOST=${SUPER_SECRET_HOST}
```


## Using psycopg2

- The only way to run psycopg2 in an AWS Lambda environment is to use a custom built [psycopg2 wrapper](https://github.com/jkehler/awslambda-psycopg2)


- When deploying, we clone the awslambda-psycopg2 repo amd move awslambda-psycopg2/psycopg2-3.7 to psycopg2 and move it to the root of the project to replace psycopg2 with this wrapper that enables it to run on AWS Lambda

- For using psycopg2, reference the deploy script seen [here](https://github.com/VolaTrade/orderbook-importer). 


