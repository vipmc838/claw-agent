FROM debian:bullseye-slim

WORKDIR /app

# 安装依赖
RUN apt-get update && \
    apt-get install -y curl wget jq unzip ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# 支持传入版本参数，默认 latest
ARG DASHBOARD_VERSION=latest
ENV DASHBOARD_VERSION=$DASHBOARD_VERSION

# 根据版本自动选择 API 路径，下载并解压 nezha-agent
RUN set -eux; \
    if [ "$DASHBOARD_VERSION" = "latest" ]; then \
        API_URL="https://gitee.com/api/v5/repos/naibahq/agent/releases/latest"; \
    else \
        API_URL="https://gitee.com/api/v5/repos/naibahq/agent/releases/tags/$DASHBOARD_VERSION"; \
    fi; \
    AGENT_URL=$(curl -s $API_URL | jq -r '.assets[] | select(.name | endswith("linux_amd64.zip")) | .browser_download_url'); \
    if [ -z "$AGENT_URL" ] || [ "$AGENT_URL" = "null" ]; then \
        echo "❌ 获取 Agent 下载地址失败，退出"; exit 1; \
    fi; \
    wget -O nezha-agent.zip "$AGENT_URL"; \
    unzip nezha-agent.zip; \
    rm nezha-agent.zip; \
    chmod +x nezha-agent

# 拷贝启动脚本
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
