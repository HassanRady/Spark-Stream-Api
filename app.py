from SparkStream.streamer import SparkClient
from fastapi import FastAPI
import uvicorn

app = FastAPI()
client = SparkClient()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/start")
async def start_spark_stream():
    client.start_spark_stream()
    return {"status": "started"}


@app.get("/stop")
async def stop_spark_stream():
    client.stop_spark_stream()
    return {"status": "stopped"}


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=9001)
