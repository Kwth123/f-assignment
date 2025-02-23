FROM mcr.microsoft.com/dotnet/sdk:6.0

# Install Jupyter
RUN apt-get update && apt-get install -y python3-pip && \
    pip3 install jupyter

# Install .NET Interactive (F# Kernel)
RUN dotnet tool install --global Microsoft.dotnet-interactive
RUN dotnet interactive jupyter install

# Set environment variables
ENV PATH="${PATH}:/root/.dotnet/tools"

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]
