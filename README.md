# Environment setup

## Create virtual environment for tests execution
```bash
cd hello_rf
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt
```

## Deploy and configure Data Quality solution
Follow [instructions](../README.md)


## Run RF tests execution
Start RF tests with `robot` 
```
robot hello_rf/tests/trn_db_tests.robot
```
