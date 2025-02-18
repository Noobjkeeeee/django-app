FROM python:3.13

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY pyproject.toml poetry.lock ./
RUN pip install --upgrade pip "poetry==2.1.1"
RUN poetry config virtualenvs.create false
RUN poetry install --no-root

COPY mysite .

CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"]