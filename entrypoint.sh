#!/bin/bash
set -e

echo "✅正在启动 Nezha Agent，配置如下："
echo "NZ_SERVER: $NZ_SERVER"
echo "NZ_UUID: $NZ_UUID"
echo "NZ_CLIENT_SECRET: $NZ_CLIENT_SECRET"
echo "NZ_TLS: $NZ_TLS"
echo "DASHBOARD_VERSION: ${DASHBOARD_VERSION:-latest}"

# 创建配置文件
cat > config.yaml <<EOF
debug: true
disable_auto_update: true
disable_command_execute: false
disable_force_update: true
disable_nat: false
disable_send_query: false
gpu: false
insecure_tls: false
ip_report_period: 1800
report_delay: 4
server: ${NZ_SERVER}
skip_connection_count: false
skip_procs_count: false
temperature: false
tls: ${NZ_TLS}
use_gitee_to_upgrade: false
use_ipv6_country_code: false
uuid: ${NZ_UUID}
client_secret: ${NZ_CLIENT_SECRET}
EOF

echo "✅ Nezha Agent 配置完成，启动中..."
echo "📡 稍后请登录面板查看该探针是否已上线"


# 启动 Nezha Agent
exec ./nezha-agent --config config.yaml
