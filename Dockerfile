# Use a slim version of Python to keep the image small
FROM python:3.11-slim

# Set the folder inside the container where our code will live
WORKDIR /code

# Copy our list of libraries and install them
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the app and templates folders into the container
COPY ./app /code/app
COPY ./templates /code/templates

# The command to start the website when the container launches
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]