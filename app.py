from SparkStream.streamer import SparkClient
from SparkStream.cassandra import CassandraApi
from fastapi import FastAPI
import uvicorn


app = FastAPI()
client = SparkClient()
ca = CassandraApi()



@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/start")
async def start_spark_stream(topic):
    client.start_spark_stream(topic)
    return {"status": "started"}

@app.get("/stop")
async def stop_spark_stream():
    client.stop_spark_stream()
    return {"status": "stopped"}


@app.get("/stream")
async def get_stream_data():
    df = client.get_stream_data().toPandas()
    return df.to_json()

@app.get("/offline_tweets")
async def get_offline_tweets():
    df_tweets = ca.get_offline_data().toPandas()
    return df_tweets.to_json()


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=9001)