---
layout: post
title:  "Milvus VectorDB Knowledge-base COMPLETE WALKTHROUGH"
date:   2024-09-10 07:00:00 +0700
comments: True
featured: true
---

Quick notes on my device specifications
> MacOS Sonoma\
> Macbook Pro 16 2023

## Installing Milvus

#### Install Docker

Docker download link: https://docs.docker.com/desktop/install/mac-install/

#### Install Milvus via Docker Compose

Milvus provides a Docker Compose configuration file in the Milvus repository. To install Milvus using Docker Compose:

1. Navigate to the directory, which you wished to install Milvus in
2. Run the following 

```bash
wget https://github.com/milvus-io/milvus/releases/download/v2.4.4/milvus-standalone-docker-compose.yml -O docker-compose.yml

```

Install via Docker Compose using the downloaded .yml file

```bash
sudo docker compose up -d
```

After starting up Milvus,

- Containers named **milvus-standalone**, **milvus-minio**, and **milvus-etcd** are up.
    - The **milvus-etcd** container does not expose any ports to the host and maps its data to **volumes/etcd** in the current folder.
    - The **milvus-minio** container serves ports **9090** and **9091** locally with the default authentication credentials and maps its data to **volumes/minio** in the current folder.
    - The **milvus-standalone** container serves ports **19530** locally with the default settings and maps its data to **volumes/milvus** in the current folder.

![alt text]({{ site.baseurl }}/assets/image/kw-base/milvus-docker.png)

You can check if the containers are up and running using the following command:

```bash
sudo docker compose ps
```

You can stop and delete this container as follows

```bash
sudo docker compose down

sudo rm -rf volumes
```

## Installing Attu

Attu, a GUI for Milvus, using Docker: https://github.com/zilliztech/attu

First get your IP

```bash
ipconfig getifaddr en0
```

MILVUS IP below should be changed into your IP. 

```bash
docker run -p 8000:3000 -e MILVUS_URL={MILVUS IP}:19530 zilliz/attu:v2.4.0
```

Make sure that the Attu container can access the Milvus IP address. After starting the container, open your web browser and enter `http://{ Attu IP }:8000` to view the Attu GUI.

### Notes on Docker & Podman Situation

<aside>
💡

Since Docker and Docker desktop get flagged by MacOS, and we are endorsed to use Podman instread, so we can easily migrates our docker utilization to Podman by the following methods. 

</aside>

Firstly, Podman can be download in the following link: https://podman-desktop.io/

After the installation of Podman, you can see Podman Desktop being installed in your device, the syntax usage is similar to that of Docker’s, for example - 

Using Docker, the following syntax is used

```bash
docker run -p 8000:3000 -e MILVUS_URL={milvus server IP}:19530 zilliz/attu:v2.4
```

But in Podman, the following will be used instead, you can observe that the only change is the command from `docker` to `podman` 

```bash
podman run -p 8000:3000 -e MILVUS_URL={milvus server IP}:19530 zilliz/attu:v2.4
```

Afterwards, the container can be shown running in the Podman user interface in Podman Desktop.

Afterwards, the container can be shown running in the Podman user interface in Podman Desktop. 

![alt text]({{ site.baseurl }}/assets/image/kw-base/podman.png)

Container status as shown in Podman interface

### Validate Installations

#### Validating Milvus

Create a file: `milvus_standalone.py`

```python
from pymilvus import connections, utility, MilvusException

connections.connect(host="localhost", port="19530")

try:
    # List all collections
    collections = utility.list_collections()
    print(f"List all collections:\n", collections)
except MilvusException as e:
    print(e)
```

If you run `milvus_standalone.py`, you should get the following response:

> List all collections:
> 
> 
> []
> 

#### Validating Attu

Attu should be located in your local host port 8000

![alt text]({{ site.baseurl }}/assets/image/kw-base/attu.png)

Click Connect and you should be redirected to the GUI.  Enable Authentication for additional credentials if needed. 

# Connection

## Establish Connection to Milvus

<aside>
💡

**Ensure to connect to Milvus server before any operations.**

</aside>

Below example connects to a Milvus server with host as **`localhost`** and port as **`19530`** and disconnects from it.

#### Example Code for Milvus Connection

Establishing Connection:

```python
from pymilvus import connections, FieldSchema, CollectionSchema, DataType, Collection, utility

MILVUS_HOST = '{milvus_host}'  
MILVUS_PORT = '19530'
MILVUS_USER = '{user}'
MILVUS_PASSWORD = '{password}'

connections.connect(
    alias='default',
    host=MILVUS_HOST,
    port=MILVUS_PORT,
    user=MILVUS_USER,
    password=MILVUS_PASSWORD
)
```

Terminating Connection:

```python
connections.disconnect(alias="default")
```

The maximum number of connections is 65,536.

## Create, Load and Monitor Collections

### Create Collection Via Attu

<aside>
💡

For a more dynamic approach, navigate to the next section, which will be covering the creation of a collection via code [Create Collection Via Code](https://www.notion.so/Create-Collection-Via-Code-14e710816f7a4aed883b0c22f61e4119?pvs=21) 

</aside>

After logging in, you will be greeted with the main dashboard. From this page, you can navigate to the `Database` tab.

![alt text]({{ site.baseurl }}/assets/image/kw-base/dashboard.png)
Dashboard of Attu

![alt text]({{ site.baseurl }}/assets/image/kw-base/database.png)
Collection Screen

From this tab, you can click the `+ Collection` button to create a new collection. Fill in the informations according to the vector csv that you have generated. (be sure to set the max length of the description field to properly accommodate your data.)

![alt text]({{ site.baseurl }}/assets/image/kw-base/collection.png)

Once you have created the collection you will have a new collection appears in your defualt database.  Now you can navigate to `Partitions` tab inside your new collection, and click `import data` 

![alt text]({{ site.baseurl }}/assets/image/kw-base/import.png)

After that you have to go back to `Overview` tab and click `+ Create Index` . In the pop-up window, name your index, and then set the Metric type to `L2` (Or any metrics that you need to use, which we will discuss this in a later section). Then hit `Create` .

![alt text]({{ site.baseurl }}/assets/image/kw-base/index.png)

Finally, click `unloaded` to load the data as below, this will take a minute. And now the collection is loaded and ready to be use!!!! 🥳

![alt text]({{ site.baseurl }}/assets/image/kw-base/load.png)


### Create Collection Via Code

Creating collection via code can be done by the following steps

#### 1 Define Connection to Milvus

Same principle as the aforementioned importance of defining the connection to Milvus [Establish Connection to Milvus](https://www.notion.so/Establish-Connection-to-Milvus-7407d5dbe670438abb6a0aed2e33f478?pvs=21), which can be done with the following lines of code:

```python
from pymilvus import connections, FieldSchema, CollectionSchema, DataType, Collection, utility
connections.connect(
    alias='default',
    host=MILVUS_HOST,
    port=MILVUS_PORT,
    user=MILVUS_USER,
    password=MILVUS_PASSWORD
)
```

#### 2 Define Schemas

After defining connection to Milvus, you can set parameters of each fields within the schemas that you are going to create. Using the `FieldSchema` class - more details can be found here (https://milvus.io/docs/schema.md#Field-schema)

```python
fields = [
    FieldSchema(name="search_uuid", dtype=DataType.VARCHAR, max_length=1024, is_primary=True, auto_id=False),
    FieldSchema(name="keyword_search", dtype=DataType.VARCHAR, max_length=1024),
    FieldSchema(name="embeddings", dtype=DataType.FLOAT_VECTOR, dim=768),
    FieldSchema(name="summary", dtype=DataType.VARCHAR, max_length=1024),
    FieldSchema(name="user_ids", dtype=DataType.VARCHAR, max_length=1024)
]
schema = CollectionSchema(fields=fields, description="Collection for storing feedback data")
```

#### 3 Create Collection

Script to check if the Database already contain the collection

```python
if not utility.has_collection(collection_name):
    collection = Collection(name=collection_name, schema=schema)
    print(f"Collection '{collection_name}' created.")
    
else:
    collection = Collection(name=collection_name)
    print(f"Collection '{collection_name}' already exists.")
```

#### 4 Define and Create Index

Define index within the collection, a collection needs to have index first before the ability to be loaded.

```python
index_params = {
    "index_type": "IVF_FLAT",
    "metric_type": "COSINE",
    "params": {
        "nlist": 128
    }
}

collection.create_index(
    field_name="embeddings",  # Corrected from 'embedding' to 'embeddings'
    index_params=index_params,
    index_name="ivt_flat_128"
)
```

#### 5 Load Collection

Load the collection to be able to utilize the semantic search within the collection. 

```python
collection.load()
```

#### Example Code for Creating Collection

Now we can put together the codes above, which will combined into a collection creating and loading script like below.

```python
# 1 Define connection to Milvus
connections.connect(
    alias='default',
    host=MILVUS_HOST,
    port=MILVUS_PORT,
    user=MILVUS_USER,
    password=MILVUS_PASSWORD
)

# 2 Define field schemas
fields = [
    FieldSchema(name="search_uuid", dtype=DataType.VARCHAR, max_length=1024, is_primary=True, auto_id=False),
    FieldSchema(name="keyword_search", dtype=DataType.VARCHAR, max_length=1024),
    FieldSchema(name="embeddings", dtype=DataType.FLOAT_VECTOR, dim=768),
    FieldSchema(name="summary", dtype=DataType.VARCHAR, max_length=1024),
    FieldSchema(name="user_ids", dtype=DataType.VARCHAR, max_length=1024)
]
schema = CollectionSchema(fields=fields, description="Collection for storing feedback data")

# 3 Create collection
collection_name = "your_collection_here"

# Check if the collection exists, if not, create it
if not utility.has_collection(collection_name):
    collection = Collection(name=collection_name, schema=schema)
    print(f"Collection '{collection_name}' created.")
    
else:
    collection = Collection(name=collection_name)
    print(f"Collection '{collection_name}' already exists.")

# 4 Define and Create Index for the collection
index_params = {
    "index_type": "IVF_FLAT",
    "metric_type": "COSINE",
    "params": {
        "nlist": 128
    }
}

collection.create_index(
    field_name="embeddings",  # Corrected from 'embedding' to 'embeddings'
    index_params=index_params,
    index_name="ivt_flat_128"
)

# 5 Load collection
collection.load()
```

### Collection Monitoring

Below are a few pointers for maintaining and monitoring Milvus Database via Attu user interface. 


![alt text]({{ site.baseurl }}/assets/image/kw-base/col.png)
Collections in Database Page

![alt text]({{ site.baseurl }}/assets/image/kw-base/overview.png)
Collection Overview Page

#### **Database Page**

- On the left tab, below the default database name, shows the list of existing collections within the current database.
- The main right tab is a more detailed visualization of the collections within the database, shown along their respective attributes - name, status (loaded/unloaded), etc.
- From this page, you can monitor an **approximation of entities** that exists within each collection, and also their **load status**, meaning if they are ready to be vector searched or not (more on in the later section).
- Additionally, you can also create new collection from the UI in this page, as mentioned above.

#### **Collection Detail Page**

- Once you clicked one of the collection from the collection list in the Database page, you will be greeted with Collection Overview Page.
- In this page, you can monitor more in-depth details of each of the collections, most importantly - the schema of each collection.
- Each collection’s schemas are shown in their respective Overview pages, this will tells you details such as - Field names and their limitations, and most importantly their respective primary key types, which will be explained below [Notes on Primary Key (AutoID vs Unique ID)

### Notes on Primary Key (AutoID vs Unique ID)

![alt text]({{ site.baseurl }}/assets/image/kw-base/autoid.png)

AutoID Enabled

AutoID is an attribute of the primary field that determines whether to enable AutoIncrement for the primary field. The value of AutoID is defined based on a timestamp, allows the primary field to automatically increment

![alt text]({{ site.baseurl }}/assets/image/kw-base/noautoid.png)

AutoID Disabled

The following is an example - `FieldSchema(name="temp", dtype=DataType.VARCHAR, max_length=1024, is_primary=True, auto_id=False)` , the primary will be non-incremental, which will allow us to perform an upsert within the collection.

### Dropping Collection

```python
from pymilvus import utility
utility.drop_collection("book")
```

## Insert, Upsert, Delete

### Insert

To insert entities into a collection, use the [**`insert()`**](https://milvus.io/api-reference/pymilvus/v2.4.x/MilvusClient/Vector/insert.md) method.

```python
def insert_into_milvus(collection, data, token):
    connections.connect(
        alias='default',
        host=MILVUS_HOST,
        port=MILVUS_PORT,
        user=MILVUS_USER,
        password=MILVUS_PASSWORD
        )
    # Extract and prepare the data lists
    keyword_search = [item['keyword_search'] for item in data]
    document_topic = [item['document_topic'] for item in data]
   
    # Embed the text (either 'question' or 'summary') depending on the collection
    embeddings = [get_embedding(token, keyword_search) for item in data]

    # Insert data into the collection
    collection.insert([
        keyword_search,
        embeddings,
        document_topic
    ])
    print(f"Inserted {len(data)} records into '{collection.name}'.")
```

### Upsert

In Milvus, an upsert operation performs a data-level action to either insert or update an entity based on whether its **primary key already exists in a collection**. Specifically:

- If the primary key of the entity already exists in the collection, the existing entity will be overwritten.
- If the primary key does not exist in the collection, a new entity will be inserted.
- **Upsert operations will not update the primary keys.**
- **Upsert operations does not support collections with `autoID` enabled.**

```python
def insert_into_milvus(collection, data, token):
    connections.connect(
        alias='default',
        host=MILVUS_HOST,
        port=MILVUS_PORT,
        user=MILVUS_USER,
        password=MILVUS_PASSWORD
        )
    # Extract and prepare the data lists
    search_uuids = [item['search_uuids'][0] for item in data]  # Use the first UUID as the primary key
    keyword_search = [item['keyword_search'] for item in data]
    document_topic = [item['document_topic'] for item in data]
   
    # Embed the text (either 'question' or 'summary') depending on the collection
    embeddings = [get_embedding(token, keyword_search) for item in data]

    # Insert data into the collection
    collection.upsert([ # Notice upsert 
        search_uuids, # search_uuid is implemented in order to upsert
        keyword_search,
        embeddings,
        document_topic
    ])
    print(f"Inserted {len(data)} records into '{collection.name}'.")
```

### Delete

Milvus offers two ways for you to identify the entities to delete.

**Delete entities by filter.**

When using filter expressions to delete entities, ensure the collection has been loaded. Otherwise, Milvus will return an error.

```python
collection = Collection("temp_collection_001")      
collection.delete("id in [001,002,003]")
```

**Delete entities by IDs.**

The following snippets demonstrate how to delete entities by IDs from a specific partition. It also works if you leave the partition name unspecified.

```python
collection = Collection("temp_collection_001")      
collection.delete("search_uuid == 'temp_uuid_0001'")
```

```python
collection = Collection("temp_collection_001")      
expr="""
user_ids == 'POCGenAi03' and keyword_search == 'ลูกค้าสมัคร promptpay ได้อย่างไร' and document_topic == 'สมัครพร้อมเพย์ (SUPER USER).pdf' and summary =="ลูกค้าสามารถสมัครพร้อมเพย์ผ่านระบบ Krungthai Corporate Online โดยทำตามขั้นตอนในเอกสาร 'การลงทะเบียนข้อมูลผู้ใช้งานพร้อมเพย์นิติบุคคล' โดยใช้ Super User"
"""
collection.delete(expr)
```

**Delete Entire Collection (Empty the whole collection)**

BE CAEFUL! This will select all the entities in the collection and delete them.

```python
from pymilvus import connections, FieldSchema, CollectionSchema, DataType, Collection, utility

def connect():
    connection = None
    try:
        connection = psycopg2.connect(
            host=PG_HOST,
            database=PG_DATABASE,
            port=PG_PORT,
            user=PG_USER_UAT,
            password=PG_PASSWORD_UAT
        )
    except Exception as error:
        print(f"Error: {error}")
        return None
    return connection

MILVUS_HOST = '10.9.228.99'  
MILVUS_PORT = '19530'
MILVUS_USER = 'root'
MILVUS_PASSWORD = 'Milvus'

connections.connect(
    alias='default',
    host=MILVUS_HOST,
    port=MILVUS_PORT,
    user=MILVUS_USER,
    password=MILVUS_PASSWORD
)

collection = Collection("test_delete")      
expr="search_uuid!=''"
collection.delete(expr)
```

## Semantic Search (Vector Search)

Semantic search compares your query vector with the existing vectors in your collection and returns the IDs of the closest matches along with the distances between them. Optionally, it can also return the vector values and metadata of the results.

### Metrics

The followinf section will be going over in a brief details of the metrics that can be used to calculate our vector similarities

Common Metrics Types for Semantic Search:

- Euclidean distance (L2)
- Inner product (IP) (Not relevant in our use case)
- Cosine similarity (COSINE) *

#### Euclidean distance (L2)

Essentially, Euclidean distance measures the length of a segment that connects 2 points.

![euclidean](https://milvus.io/docs/v2.4.x/assets/euclidean_metric.png)

euclidean

where **a** = (a0, a1,…, an-1) and **b** = (b0, b0,…, bn-1) are two points in n-dimensional Euclidean space

It’s the most commonly used distance metric and is very useful when the data are continuous.

**Milvus only calculates the value before applying square root when Euclidean distance is chosen as the distance metric.**

#### Cosine similarity (COSINE) *

Cosine similarity uses the cosine of the angle between two sets of vectors to measure how similar they are. You can think of the two sets of vectors as two line segments that start from the same origin ([0,0,…]) but point in different directions.

To calculate the cosine similarity between two sets of vectors **A = (a0, a1,…, an-1)** and **B = (b0, b1,…, bn-1)**, use the following formula:

![cosine_similarity](https://milvus.io/docs/v2.4.x/assets/cosine_similarity.png)

cosine_similarity

The cosine similarity is always in the interval **[-1, 1]**. For example, two proportional vectors have a cosine similarity of **1**, two orthogonal vectors have a similarity of **0**, and two opposite vectors have a similarity of **-1**. The larger the cosine, the smaller the angle between two vectors, indicating that these two vectors are more similar to each other.

By subtracting their cosine similarity from 1, you can get the cosine distance between two vectors.

#### Metric Type In-Use

While cosine looks at the angle between vectors (thus not taking into regard their weight or magnitude), euclidean distance is similar to using a ruler to actually measure the distance. 

**Generally COSINE metrics works better with document type queries**

Cosine similarity is generally used as a metric for measuring distance when the **magnitude of the vectors does not matter**. This happens for example when working with text data represented by word counts. We could assume that when a word (e.g. `science`) occurs more frequent in document 1 than it does in document 2, that document 1 is more related to the topic of `science`. However, it could also be the case that we are working with documents of uneven lengths (Wikipedia articles for example). Then, `science` probably occurred more in document 1 just because it was way longer than document 2. Cosine similarity corrects for this.

**Text data** is the most typical example for when to use this metric. However, you might also want to apply cosine similarity for other cases where some properties of the instances make so that the weights might be larger without meaning anything different. Sensor values that were captured in various lengths (in time) between instances could be such an example.

## Vector Search in Milvus

#### Example

#### Example Use-Case: Similar entity querying

This function can be use to only query the most similar entity in the collection, with an adjustable threshold.

```python
# Print Top-5 similar questions
def top_similar(text, nprobe=128, limit=5):

    collection = Collection("temp_question_feedback2")
    
    tokens = getCredential('./credential/ktb-contact-center-nonprd-vertexai.json')
    token = tokens['Token']
    
    text_to_search = text
    query_embedding = call_embedding(token, 'http://10.9.93.83:8443/contactcenter-textembedding', text_to_search)
    
    search_params = {"metric_type": "COSINE", "params": {"nprobe": nprobe}}
    similarity_search_result = collection.search(
                data=[query_embedding],
                anns_field="embedding",
                param=search_params,
                limit=limit,
                output_fields=['search_uuid' ,'question', 'summary']
            )

    for hit in similarity_search_result[0]:
        uuid = hit.entity.get("search_uuid")
        question = hit.entity.get("question")
        summary = hit.entity.get("summary")
        distance = hit.distance
        
        if distance > 0.945: # Adjust this value to suit the application
            match = True
            print(f"Question: {question}, Distance: {distance}")
            return match, uuid, question, summary

```

#### Example Use-Case: Streaming search

This is an example script to test the distance and the query capacity of the created collection, the main benefit form this script, is that you can quickly see the distance differences between each queries for a quick comparison.

```python
import numpy as np
from pymilvus import connections, Collection, MilvusException
from typing import List, Optional
import requests

try:
    while True:
        tokens = getCredential('./credential/ktb-contact-center-nonprd-vertexai.json')
        token = tokens['Token']
        # Get user input for PDF description or exit
        user_input = input("\n======================================================================\nDescribe what would you like to know (or type 'exit' to quit):\n")

        # Exit loop if user types 'exit'
        if user_input.lower() == 'exit':
            break

        # Process user input using the Sentence Transformer model to get the embedding vector
        user_vector = get_embedding(token, user_input)

        # Ensure the vector matches the expected dimension
        # Milvus expects 3072 bytes which is 768 floats (since 1 float = 4 bytes)
        expected_dimension = 768
        current_dimension = len(user_vector)

        if current_dimension < expected_dimension:
            user_vector = np.pad(user_vector, (0, expected_dimension - current_dimension), 'constant')
        elif current_dimension > expected_dimension:
            user_vector = user_vector[:expected_dimension]

        # user_vector = user_vector.tolist()

        # Define search parameters for similarity search
        search_params = {
            "metric_type": "COSINE",
            "params": {"nprobe": 10}
        }

        # Connect to the Milvus collection named "temp"
        collection = Collection("temp")

        # Perform similarity search using Milvus
        similarity_search_result = collection.search(
            data=[user_vector],
            anns_field="embedding",
            param=search_params,
            limit=50,
            # output_fields=['source', 'text']
            output_fields=['source']
        )

        # Display search results to the user and get the top result
        top_result = None
        for idx, hit in enumerate(similarity_search_result[0]):
            score = hit.distance
            filename = hit.entity.get("source")
            # summary = hit.entity.get("text")
            print(f"{idx + 1}. Filename: {filename} (distance: {score})")
            # print(f"Summary: {summary}\n")
            if idx == 0:
                top_result = filename

        if top_result:
            with open("top_result.txt", "w") as file:
                file.write(top_result)

except MilvusException as e:
    # Handle Milvus exceptions
    print(e)
finally:
    # Disconnect from Milvus server
    connections.disconnect(alias="localhost")

```

## Query (Scalar Search)

### Basic Operations

Get entities by ID and conduct scalar filtering. A scalar filtering retrieves entities that match the specified filtering conditions.

<aside>
💡

Query in this case means to get the specific record/entities in a collection using a defined condition using boolean expressions, unlike a vector search, which identifies the closest vector to a given vector in a collection, queries filter entities based on specific criteria - In Milvus, **a filter is always a string with field names joined by operators**.

</aside>

```python
# Set collection here
collection = Collection("temp_collection")

# Query for the 'source' field
expr = ""  # Empty expression to retrieve all records, for filter, see section below
results = collection.query(expr=expr, output_fields=['search_uuid'], limit=1000)

# Write results to a text file
output_file = 'milvus_query_questions_dislike.txt'

with open(output_file, 'x') as f:
    for result in results:
        # Write each 'source' field value to the file
        text = str(result['question'] + ";" + result['source'] + ";" + result['summary'] + "\n\n\n")
        f.write(text)

print(f"Query results have been written to {output_file}")
```

### Scalar Filters

| **Operator** | **Description** |
| --- | --- |
| **and (&&)** | True if both operands are true |
| **or (\|\|)** | True if either operand is true |
| **+, -, *, /** | Addition, subtraction, multiplication, and division |
| ****** | Exponent |
| **%** | Modulus |
| **<, >** | Less than, greater than |
| **==, !=** | Equal to, not equal to |
| **<=, >=** | Less than or equal to, greater than or equal to |
| **not** | Reverses the result of a given condition. |
| **like** | Compares a value to similar values using wildcard operators.For example, like “prefix%” matches strings that begin with "prefix". |
| **in** | Tests if an expression matches any value in a list of values. |

**Basic Operators (Table to the left)**

A **boolean expression** is always **a string comprising field names joined by operators**. In this section, you will learn more about basic operators.

```python
# Query for the 'source' field with filter
expr = "uuid in [2,4,6,8]"  # Filter only uuid of 2, 4, 6, 8
results = collection.query(expr=expr, output_fields=['search_uuid'])
```

**Advanced operators**

**`count(*)`** Counts the exact number of entities in the collection. Use this as an output field to get the exact number of entities in a collection or partition.

- This applies to loaded collections. You should use it as the only output field.

## End Notes

### Additional Resources and References

[The High-Performance Vector Database Built for Scale - Milvus](https://milvus.io/)

[Manage Schema - Milvus Documentation](https://milvus.io/docs/schema.md#Field-schema)

[Product FAQ - Milvus Documentation](https://milvus.io/docs/product_faq.md)

[Milvus Limits - Milvus Documentation](https://milvus.io/docs/limitations.md)

[Attu](https://github.com/zilliztech/attu)

[Euclidean vs. Cosine Distance](https://cmry.github.io/notes/euclidean-v-cosine)

[Reranking - Milvus Documentation](https://milvus.io/docs/reranking.md)

#### Basic Function Script in used

```python
from pymilvus import connections, FieldSchema, CollectionSchema, DataType, Collection, utility

def getToken(credential):
    
    url = 'http://10.9.93.83:8443/google-authen'
    data = {
        'service_account': credential
    }
    
    headers = {
        'Content-Type':'application/json'
    }
    
    response = requests.post(url, data, headers)
    
    return response.json()

def getCredential(filepath: str) -> dict:
    """
    Get credential from google
    """
    with open(filepath, 'r') as fr:
        credential = fr.read()
    return getToken(credential)

def call_embedding(token, url, text):
   
    URL = url
    headers = {
        "Authorization": "Bearer " + token,
        "Content-Type": "application/json",
    }
    
    data = {
        "instances": [
        { 
               "content": text
        }
        ],
         "parameters": { 
         "autoTruncate": True
     }
    }
    
    response = requests.post(URL, headers=headers, json=data)

    if not response.ok:
        print(response.text)
        raise ValueError("Request failed: " , response)

    result = response.json()
    
    return result['predictions'][0]['embeddings']['values']

def connect():
    connection = None
    try:
        connection = psycopg2.connect(
            host=PG_HOST,
            database=PG_DATABASE,
            port=PG_PORT,
            user=PG_USER_UAT,
            password=PG_PASSWORD_UAT
        )
    except Exception as error:
        print(f"Error: {error}")
        return None
    return connection

PG_HOST="10.9.228.106"
PG_PORT="5432"
PG_DATABASE="poc_genai_cc_km"

PG_USER_SIT="user_sit"
PG_PASSWORD_SIT="uu4VM1cd"
PG_SCHEMA_SIT="poc_genai_cc_km_sit"

PG_USER_UAT="user_uat"
PG_PASSWORD_UAT="N6bYJMl2"
PG_SCHEMA_UAT="poc_genai_cc_km_uat"

MILVUS_HOST = '10.9.228.99'  
MILVUS_PORT = '19530'
MILVUS_USER = 'root'
MILVUS_PASSWORD = 'Milvus'

connections.connect(
    alias='default',
    host=MILVUS_HOST,
    port=MILVUS_PORT,
    user=MILVUS_USER,
    password=MILVUS_PASSWORD
)

def get_embedding(token, text, embedding_url='http://10.9.93.83:8443/contactcenter-textembedding'):
    vector = call_embedding(token, embedding_url, text)
    
    expected_dimension = 768
    current_dimension = len(vector)
    
    # Ensure the vector is of the correct dimension
    if current_dimension < expected_dimension:
        vector = np.pad(vector, (0, expected_dimension - current_dimension), 'constant')
    elif current_dimension > expected_dimension:
        vector = vector[:expected_dimension]
    
    return vector
```

#### Schema for feedback

```python
fields = [
        FieldSchema(name="search_uuid", dtype=DataType.VARCHAR, max_length=3000, is_primary=True, auto_id=False),
        FieldSchema(name="keyword_search", dtype=DataType.VARCHAR, max_length=3000),
        FieldSchema(name="embeddings", dtype=DataType.FLOAT_VECTOR, dim=768),
        FieldSchema(name="document_topic", dtype=DataType.VARCHAR, max_length=10000),
        FieldSchema(name="summary", dtype=DataType.VARCHAR, max_length=20000),
        FieldSchema(name="reasons", dtype=DataType.VARCHAR, max_length=3000),
        FieldSchema(name="user_ids", dtype=DataType.VARCHAR, max_length=3000),
        FieldSchema(name="document_link", dtype=DataType.VARCHAR, max_length=10000)
    ]
```


Feel free to contact me if you have any questions!!