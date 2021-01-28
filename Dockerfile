FROM continuumio/miniconda3

WORKDIR /app

# Create the environment:
# RUN apt-get update
# RUN apt-get install 'ffmpeg'\
#     'libsm6'\ 
#     'libxext6'  -y
	
COPY . .
RUN conda env create -n venv -f environment.yml

CMD ["conda", "run", "-n", "venv", "uvicorn", "face-api:app", "--host", "0.0.0.0", "--port", "${PORT:-5000}"]