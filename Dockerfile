# Use an official Python runtime as a parent image
FROM python:3.9

# Create a user to run the application
RUN adduser --disabled-password --gecos '' appuser

# Set the working directory in the container
WORKDIR /home/appuser

# Copy the requirements file and install Python dependencies
COPY --chown=appuser:appuser requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install dependencies required for OpenCV
RUN apt-get update \
    && apt-get install -y libgl1-mesa-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the application code to the container
COPY --chown=appuser:appuser . .

# Change to the appuser
USER appuser

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "app.py"]
