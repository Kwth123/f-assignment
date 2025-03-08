FROM mcr.microsoft.com/dotnet/sdk:6.0

# Install Python, pip, and Jupyter
RUN apt-get update && apt-get install -y python3-pip && \
    pip3 install jupyter

# Install .NET Interactive (F# Kernel) and register with Jupyter
RUN dotnet tool install --global Microsoft.dotnet-interactive --version 1.0.611002
RUN dotnet interactive jupyter install

# Add .NET global tools to PATH
ENV PATH="$PATH:/root/.dotnet/tools"

# Expose Jupyter's port (if you plan to run locally)
EXPOSE 8888

# Start Jupyter automatically (optional, for local usage)
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
