# 细胞制剂交付追溯服务

该服务记录细胞制剂批次在放行、运输、接收和处置过程中的交接数据。应用使用 Spring Boot，业务状态与审计记录保存在 PostgreSQL。

## 容器启动

```bash
docker compose up --build
curl http://localhost:8080/health
```

运行测试镜像：

```bash
docker build --target test -t cell-therapy-trace-test .
docker run --rm cell-therapy-trace-test
```

数据库变更放在 `src/main/resources/db/migration/`，运行配置通过环境变量传入。
