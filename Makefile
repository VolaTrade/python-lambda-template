test:
	python3 -m unittest discover -s tests

validate-template:
	sudo sls deploy --noDeploy --stage dev --region us-west-2