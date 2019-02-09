FROM python:3.5-alpine AS builder

WORKDIR /work/

RUN apk add --no-cache --virtual .build-deps \
    build-base

COPY requirements.txt .

RUN pip install --user -r requirements.txt

FROM python:3.5-alpine AS runner

WORKDIR /work/

COPY --from=builder /root/.local/ /root/.local/
# COPY . .

EXPOSE 3000

CMD ["python", "src/main.py"]
