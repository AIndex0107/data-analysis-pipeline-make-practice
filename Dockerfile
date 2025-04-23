FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-lock.yml /tmp/conda-lock.yml
COPY data/* /home/data

RUN mamba update --quiet --file /tmp/conda-lock.yml
RUN mamba clean --all -y -f
RUN fix-permissions "${CONDA_DIR}"
RUN fix-permissions "/home/${NB_USER}"