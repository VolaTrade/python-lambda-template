from src.job import main

# Wrapper for main logic, runs when lambda is triggered
def handler(event, context):
    main(event, context)


if __name__ == "__main__":
    handler("","")
