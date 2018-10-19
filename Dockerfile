FROM continuumio/anaconda3:latest

EXPOSE 8888

WORKDIR /opt/conda/bin/

RUN ./conda install jupyter -y --quiet
RUN ./conda install --quiet --yes \
    'pandas=0.23*' \
    'matplotlib=2.2*' \
    'scipy=1.1*' \
    'scikit-learn=0.19*' \
    'sympy=1.1*' \
    'numpy=1.11*'   

VOLUME /opt/notebooks
VOLUME /opt/datasets

CMD ./jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''