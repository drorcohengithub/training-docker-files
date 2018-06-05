# Base image
FROM python:3.6

RUN mkdir /training
WORKDIR /training

ENV RAW_DATA_PATH=/training/category-prediction-model/data/raw-data

# Copying requirements.txt file
COPY pip_req_frozen.txt requirements.txt

# pip install
RUN pip install -r requirements.txt

# install fastText
RUN git clone https://github.com/facebookresearch/fastText.git && cd fastText && make

# install nano
RUN apt-get update && apt-get install nano

# Next need to set R up in the image, try: https://cran.r-project.org/bin/linux/debian/ or https://github.com/Kaggle/docker-rstats/blob/master/Dockerfile

ENTRYPOINT /bin/bash
