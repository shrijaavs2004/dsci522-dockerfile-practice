# Extend the Jupyter minimal-notebook image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Set working directory inside the container
WORKDIR /home/jovyan

# Copy the explicit conda lock file into the container
COPY conda-linux-64.lock .

# Install packages from the lock file
RUN conda install --yes --file conda-linux-64.lock

# Ensure permissions are correct for the jovyan user
USER jovyan

# Start the notebook by default
CMD ["start-notebook.sh"]
