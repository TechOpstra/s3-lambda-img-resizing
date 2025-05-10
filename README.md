# s3-lambda-img-resizing

##steps to install dependencies and zip the .py fle
1. sudo apt-get update
2. sudo apt-get install python3.9 python3.9-venv python3.9-dev
mkdir function
cd function
vim lambda_function.py  --paste python script in the .py file
python3.9 -m venv venv
source venv/bin/activate
pip install Pillow 
mkdir package
cp -r venv/lib/python3.9/site-packages/* package/
cp function/lambda_function.py package/
cd package
zip -r ../lambda_function.zip .
