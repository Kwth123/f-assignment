FROM mcr.microsoft.com/dotnet/sdk:6.0
FROM mcr.microsoft.com/dotnet/sdk:9.0

# Install Jupyter
# Install dependencies
RUN apt-get update && apt-get install -y python3-pip && \
    pip3 install jupyter

# Install .NET Interactive (F# Kernel)
RUN dotnet tool install --global Microsoft.dotnet-interactive
RUN dotnet tool install --global Microsoft.dotnet-interactive --version 1.0.611002
RUN dotnet interactive jupyter install

# Set environment variables
