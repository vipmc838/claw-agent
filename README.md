
# Claw Cloud 部署 Agent Docker 镜像

![Docker 镜像大小](https://img.shields.io/docker/image-size/mc838/claw-agent/latest)
![Docker 拉取次数](https://img.shields.io/docker/pulls/mc838/claw-agent)
![License](https://img.shields.io/github/license/nezhahq/agent)

这是一个用于claw.cloud部署 [哪吒监控 Agent](https://github.com/vipmc838/claw-agent) 的轻量级 Docker 镜像，支持自动下载、自动配置、自动运行。

## ➡️Claw.Cloud官网(GitHub注册送5美元地址)：[run.claw.cloud](https://console.run.claw.cloud/signin?link=M9P7GXP3M3W5)
---
## 📦 项目版本说明
- Hysteria2版本 ➡️[Hysteria2](https://github.com/vipmc838/claw-hy2)：基于 UDP 的高速代理，支持 TLS 加密与伪装。
- Nezha Agent版本 ➡️[Nezha Agent](https://github.com/vipmc838/claw-agent)：哪吒监控客户端，连接至哪吒面板进行主机监控。
- 整合版本 ➡️[Claw HY2 Agent](https://github.com/vipmc838/claw-hy2-agent)：Hysteria2 与 Nezha Agent 的集成版，支持一键部署
---

## 🚀 特性

- 基于 `debian:bullseye-slim` 构建，体积小巧
- 自动下载指定版本（或最新）哪吒 Agent 二进制文件
- 支持通过环境变量配置，无需手动修改配置文件
- 启动时自动生成配置文件并运行

---

## 📦 Docker 镜像

**镜像地址**：[`mc838/claw-agent`](https://hub.docker.com/r/mc838/claw-agent)

---

## 🛠️ 环境变量说明

| 环境变量            | 说明                         | 示例值                                         |
|---------------------|------------------------------|------------------------------------------------|
| `NZ_SERVER`         | 哪吒面板地址（含端口）       | `abc.com:443`                                  |
| `NZ_UUID`           | Agent 的唯一标识 UUID        | `a6b081a6-689b-47d1-bc72-a4ac78ba2888`       |
| `NZ_CLIENT_SECRET`  | 面板端密钥，用于身份验证     | `4z0HWnSGJ8KFtKOlfJxSk8C3F8PIJ888`            |
| `NZ_TLS`            | 是否启用 TLS（true/false）   | `true`                                         |
| `DASHBOARD_VERSION` | 指定版本（可选，默认最新）   | `v1.12.2`                                      |

---

## 1. 通过 claw.cloud 部署

1. **Application Name（应用程序名称）**  
   随便填写

2. **Image（镜像地址）**
```env
mc838/claw-agent
```
4. **Usage（机器性能配置）**  
   - CPU = 0.1  
   - Memory = 64M

5. **Environment Variables（环境变量）**
```env
NZ_SERVER=abc.com:443
NZ_UUID=a6b081a6-689b-47d1-bc72-a4ac78ba2888
NZ_CLIENT_SECRET=4z0HWnSGJ8KFtKOlfJxSk8C3F8PIJ888
NZ_TLS=true
DASHBOARD_VERSION=v1.12.2
```

---

## 鸣谢

- 哪吒官网: https://nezha.wiki/  
- Telegram 群组: https://t.me/nezhamonitoring

---

## 免责声明

- 本程序仅供学习了解，非盈利目的，请于下载后 24 小时内删除，不得用作任何商业用途，文字、数据及图片均有所属版权，如转载须注明来源。  
- 使用本程序必须遵守部署服务器所在地、所在国家和用户所在国家的法律法规，程序作者不对使用者任何不当行为负责。


