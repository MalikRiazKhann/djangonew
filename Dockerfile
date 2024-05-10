# Stage 1: Build stage
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt /

# Install dependencies
RUN pip install --no-cache-dir -r /requirements.txt

# Copy the rest of the application code into the container at /app
COPY . /app/

# Expose port 8000 to allow communication to/from server
EXPOSE 8000

# Run the Django development server when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
