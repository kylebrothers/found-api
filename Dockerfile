FROM tensorflow/tensorflow:1.15.0-gpu-py3

RUN add-apt-repository -r ppa:graphics-drivers/ppa
RUN apt-get update

RUN apt-get install -y \
build-essential \
curl \
git \
wget

RUN pip --no-cache-dir install \
keras==2.3.1 \
flask==1.1.2 \
imageio==2.9.0 \
seaborn==0.11.0 \
opencv==4.5.0 \
scikit-learn==0.23.2 \
mtcnn==0.1.0 \
requests==2.24.0 \
gevent==20.9.0

RUN mkdir -p /tf/tensorflow-tutorials && chmod -R a+rwx /tf/
RUN mkdir /.local && chmod a+rwx /.local
RUN apt-get install -y --no-install-recommends wget
WORKDIR /tf/tensorflow-tutorials
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/classification.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/overfit_and_underfit.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/regression.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/save_and_load.ipynb
RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/text_classification.ipynb RUN wget https://raw.githubusercontent.com/tensorflow/docs/master/site/en/tutorials/keras/text_classification_with_hub.ipynb RUN apt-get autoremove -y && apt-get remove -y wget WORKDIR /tf EXPOSE 8888

RUN python3 -m ipykernel.kernelspec CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root"]
