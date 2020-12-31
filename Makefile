JOB_NAME=default
PY_VERSION=3.7.7

test:
	python3 -m pytest tests/test_*.py

run:
	python3 handler.py

sls-run:
	serverless invoke local --function daily-data-report

create-env:
	sh createenv.sh

deps:
	@if python3 --version | grep $(PY_VERSION); then \
		echo "Installing dependencies"; \
		pip3 install -r requirements.txt; \
	@else \
		echo "python version seems to be off.. please run create-venv and activate-venv to properly create a python3 virtual environment"; \
	fi

create-venv:
	@if [ -x "$(command -v pyenv)" ]; then \
		echo "No matching installation of pyenv found... performing brew install"; \
		@brew install pyenv; \
	fi
	echo "Attempting to build virtual environment"
	@if ! [ -x "$(command -v pyenv activate $(PY_VERSION) $(JOB_NAME))"]; then \
		echo "Installing python version $(PY_VERSION)"; \
		@pyenv install $(PY_VERSION); \
	@else \
		@exit 0; \
	fi
	echo "Building virtual environment"
	@pyenv virtualenv $(PY_VERSION) $(JOB_NAME)


activate-venv:
	pyenv local $(JOB_NAME)
