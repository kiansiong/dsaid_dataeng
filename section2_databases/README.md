# Section 2: Databases


## Data Model
Refer to below chart for the ER diagram.

![alt text](ER_Diagram.png)


## Setup
Setup Docker container by following the below instructions:

1. Navigate to the folder with the Dockerfile.

2. Run command:  
`docker build -t postgres-cars-image .`

3. Start container with this command:  
`docker run -d --name postgres-cars-container -p 5555:5432 postgres-cars-image`


## Explainations
 - `Dockerfile` file: Contains the setup for postgres db as well the table initialisation scripts.

 - `init.sql`: Contains the table creation scripts. This will be called by the Dockerfile upon image build.
 
 - `queries.sql`: Contains the scripts for required queries
