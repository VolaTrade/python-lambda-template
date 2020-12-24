#Env variables go here
test:
	python3 -m pytest tests/test_*.py

sls-run:
	serverless invoke local --function orderbook-importer

create-env:
	sh createenv.sh