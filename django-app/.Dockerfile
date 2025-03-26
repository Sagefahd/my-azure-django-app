FROM python:3.9-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY django_app/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project
COPY django_app /app

# Expose port 80
EXPOSE 80

# Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:80", "django_app.wsgi:application"]