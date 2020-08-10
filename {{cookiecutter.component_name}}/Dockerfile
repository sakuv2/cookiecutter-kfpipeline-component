FROM python:{{cookiecutter.python_version}}-slim as builder
RUN pip install poetry
COPY pyproject.toml poetry.lock ./
RUN poetry export -f requirements.txt > requirements.txt

FROM python:{{cookiecutter.python_version}}-slim
WORKDIR /pipelines/component
COPY --from=builder /requirements.txt .
RUN pip install -r requirements.txt

COPY ./src /pipelines/component/src

ENTRYPOINT ["python", "src/main.py"]