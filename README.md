# GameCloud Deployment

This repo is part of the GameCloud system to deploy the microservices of the distributed system in a delarative way via _config as code_.
The project was created based on a similar project of the
[Cloud Native Spring in Action](https://www.manning.com/books/cloud-native-spring-in-action) book
by [Thomas Vitale](https://www.thomasvitale.com).

# Docker Compose

Using `docker-compose`, you can spin up parts of the GameCloud system.

```bash
cd docker
docker compose up -d
```

Furthermore, you can debug `catalog-service` via your IDE, using the following run configuration

```xml
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="catalog-service (Remove Debug)" type="Remote">
    <module name="catalog-service.main" />
    <option name="USE_SOCKET_TRANSPORT" value="true" />
    <option name="SERVER_MODE" value="false" />
    <option name="SHMEM_ADDRESS" />
    <option name="HOST" value="localhost" />
    <option name="PORT" value="9999" />
    <option name="AUTO_RESTART" value="false" />
    <RunnerSettings RunnerId="Debug">
      <option name="DEBUG_PORT" value="9999" />
      <option name="LOCAL" value="false" />
    </RunnerSettings>
    <method v="2" />
  </configuration>
</component>
```
