# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /home/app

# Install dependencies required for OpenCV
RUN apt-get update \
    && apt-get install -y libgl1-mesa-dev

# Create a virtual environment in the container
RUN python -m venv /home/app/venv

# Activate the virtual environment
ENV PATH="/home/app/venv/bin:$PATH"

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Command to run the Flask app
CMD ["py", "app.py"]
