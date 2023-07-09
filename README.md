# GameCloud Deployment

This repo is part of the GameCloud system to deploy the microservices of the distributed system in a delarative way via _config as code_.
The project was created based on a similar project of the
[Cloud Native Spring in Action](https://www.manning.com/books/cloud-native-spring-in-action) book
by [Thomas Vitale](https://www.thomasvitale.com).

## Docker Compose

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

## Kubernetes

As an example, to deploy the platform services for local development, run the following command from the root of the repo:

```bash
kubectl apply -f k8s/platform/dev/services
```

Then, could check the logs of either the pod, service or deployment:

```bash
kubectl get pods
kubectl logs gamecloud-postgres-{id}
kubectl logs service/gamecloud-postgres
kubectl logs deployment/gamecloud-postgres
```
