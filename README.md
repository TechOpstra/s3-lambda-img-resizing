# s3-lambda-img-resizing

##steps to install dependencies and zip the .py fle ##
1. sudo apt-get update
2. sudo apt-get install python3.9 python3.9-venv python3.9-dev
3. mkdir function
4. cd function
5. vim lambda_function.py  --paste python script in the .py file
6. python3.9 -m venv venv
7. source venv/bin/activate
8. pip install Pillow 
9. mkdir package
10. cp -r venv/lib/python3.9/site-packages/* package/
11. cp function/lambda_function.py package/
12. cd package
13. zip -r ../lambda_function.zip .
