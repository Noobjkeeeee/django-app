FROM python:3.13

WORKDIR /app

RUN pip install "poetry==2.1.1"
RUN poetry config virtualenvs.create false
COPY pyproject.toml poetry.lock ./
RUN poetry install

COPY mysite .

CMD ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]