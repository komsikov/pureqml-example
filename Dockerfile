FROM --platform=linux/amd64 pureqml

WORKDIR /app

COPY qmlcore/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir jinja2 future

# Copy .git directory for submodules
COPY .git ./.git

# Copy the rest of the project
COPY . .

# Initialize and update git submodules
RUN git submodule update --init --recursive

# Set default command (can be overridden)
ENTRYPOINT ["python", "build.py"]