# Use the official Python 3.11 image as the base image
FROM python:3.11

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /django

# Copy the requirements file into the container
COPY requirements.txt requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose port 8000 for the Django app
EXPOSE 8000

# Command to run the Django app
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "myapp.wsgi:application"]