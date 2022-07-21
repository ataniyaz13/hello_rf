# Environment setup

## Create virtual environment for tests execution
```bash
Ubuntu:
cd hello_rf
python -m venv venv && source venv/bin/activate
pip install -r requirements.txt

Windows:
cd hello_rf
python -m venv venv && .\venv\Scripts\activate.bat
pip install -r requirements.txt
```

## Deploy and configure Data Quality solution
Follow [instructions](../README.md)


## Run RF tests execution
Start RF tests with `robot` 
```
robot tests/trn_db_tests.robot
```
