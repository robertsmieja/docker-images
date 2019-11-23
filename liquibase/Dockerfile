FROM adoptopenjdk/openjdk11:jre-11.0.5_10-alpine

# ---
# Liquibase
# ---

ARG LIQUIBASE_VERSION="3.8.1"
ARG LIQUIBASE_PATH="/usr/local/lib/liquibase"
ARG LIQUIBASE_BIN="/usr/local/bin"

RUN wget https://github.com/liquibase/liquibase/releases/download/v${LIQUIBASE_VERSION}/liquibase-${LIQUIBASE_VERSION}.tar.gz -O liquibase.tar.gz && \
    mkdir -p ${LIQUIBASE_PATH} && \
    tar -xvf liquibase.tar.gz -C ${LIQUIBASE_PATH} && \
    # keep the image small
    rm -rf /liquibase.tar.gz && \
    rm -rf ${LIQUIBASE_PATH}/javadoc/ && \
    chmod +x ${LIQUIBASE_PATH}/liquibase && \
    # liquibase uses bash in the start scripts, we only have sh in Alpine
    sed -i "s|bash$|ash|" ${LIQUIBASE_PATH}/liquibase && \
    ln -s ${LIQUIBASE_PATH}/liquibase ${LIQUIBASE_BIN}


# ---
# PostgreSQL
# ---

ARG JDBC_POSTGRES_VERSION=42.2.8
ARG JDBC_POSTGRES_FILE_NAME=postgresql-${JDBC_POSTGRES_VERSION}.jar
ARG JDBC_POSTGRES_DOWNLOAD_URL=https://jdbc.postgresql.org/download/${JDBC_POSTGRES_FILE_NAME}

RUN wget ${JDBC_POSTGRES_DOWNLOAD_URL} -O ${LIQUIBASE_PATH}/lib/${JDBC_POSTGRES_FILE_NAME}


# ---
# Application data
# ---

COPY src/* /app/

WORKDIR /app/

ENTRYPOINT [ "liquibase" ]
CMD ["--logLevel=debug", "--classpath=/usr/local/lib/liquibase/lib/postgresql-42.2.8.jar:/app/", "--driver=org.postgresql.Driver", "--changeLogFile=changelog.xml", "--url=jdbc:postgresql://0.0.0.0:5432/database", "--username=", "--password=", "update"]
