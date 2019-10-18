echo "Apply database migrations"
python manage.py migrate --run-syncdb

echo "Collect static files"
python manage.py collectstatic --noinput

echo "Starting server"
exec python manage.py runserver 0.0.0.0:5000