FROM tensorflow/tensorflow:1.15.0-gpu-py3

RUN apt-get install -y \
wget

RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-key del 7fa2af80
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/7fa2af80.pub

RUN apt-get update

RUN apt-get install -y \
build-essential \
curl \
git \
wget

# RUN pip --no-cache-dir install \
keras==2.3.1 \
flask==1.1.2 \
imageio==2.9.0 \
seaborn==0.11.0 \
opencv==4.5.1.48 \
scikit-learn==0.23.2 \
mtcnn==0.1.0 \
requests==2.24.0 \
gevent==20.9.0

# COPY requirements.txt /app/requirements.txt

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
# RUN pip install -r requirements.txt

# copy every content from the local file to the image
COPY . /app

# configure the container to run in an executed manner
ENTRYPOINT [ "python" ]

CMD ["api_server.py" ]
