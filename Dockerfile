FROM mcr.microsoft.com/dotnet/sdk:9.0

# Install dependencies
RUN apt-get update && apt-get install -y python3-pip python3-venv && \
    python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install jupyter && \
    ln -s /opt/venv/bin/jupyter /usr/local/bin/jupyter

# Install .NET Interactive (F# Kernel) and Jupyter
RUN dotnet tool install --global Microsoft.dotnet-interactive --version 1.0.611002 && \
    export PATH="$PATH:/root/.dotnet/tools" && \
    dotnet interactive jupyter install

# Set environment variables
ENV PATH="${PATH}:/root/.dotnet/tools"

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]
