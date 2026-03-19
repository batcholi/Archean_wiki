Archean 提供多人游戏体验，允许您将单人游戏向其他玩家开放，或搭建专用服务器。

# 硬件要求
为确保 Archean 多人模式服务器的正常运行，建议以下最低配置：
- **处理器**：优先选择高单核性能（i7、Ryzen……）
- **内存**：至少 8 GB RAM

此配置可能会根据使用的平台（Windows、Linux 等）和未来的游戏更新而变化。

# 网络
无论选择哪种操作系统，您必须确保端口 `8881` 对 `UDP` 和 `TCP` 均已开放。

> **注意**：在没有设置 `accept_remote_connections = yes` 的情况下单人游戏时，如果端口 8881 已被占用，游戏会自动使用一个随机可用端口。

# 搭建服务器

## SteamCMD（推荐）
Archean Server 可通过 SteamCMD 获取。这是专用服务器的推荐方式，因为它可以轻松更新。

```bash
steamcmd +login anonymous +app_update 3557220 +quit
```

下载完成后，按照下方**手动安装**部分的说明运行服务器可执行文件。

## 手动安装
对于 Linux 和 Windows，都有独立的可执行文件可用于运行 Archean 服务器。

启动服务器只需运行位于 `Archean-game` 文件夹中的 `Archean_server[.exe]` 文件。服务器将以控制台模式启动，并要求您输入一系列配置信息。一旦在 `server.ini` 文件中设置了 `server_public_name` 值，将不再要求这些信息。

## Docker
要在 Linux 服务器上搭建专用服务器，您需要 `curl` 和 `Docker` 来执行自动安装脚本。

Docker 的安装方式因发行版而异。我们建议查阅您所用发行版的 Wiki 以获取安装指导。

使用官方脚本安装服务器的步骤如下：
```bash
# 下载安装脚本
curl -s -o install_archean_server.sh https://archean.space/assets/user_scripts/run_server_with_docker.sh

# 赋予执行权限
chmod +x install_archean_server.sh

# 运行此脚本以安装或更新服务器
./install_archean_server.sh
```
> 注意：可以在 Windows 上通过 WSL（Windows Subsystem for Linux）使用此方法，但部分用户反映可能存在性能问题。

## 允许访问您的单人游戏
您可以通过手动配置 `server.ini` 文件的以下参数来允许其他玩家访问您的单人游戏：
- `server_online = yes`
- `server_public_name = <您想要的任意名称>`
- `accept_remote_connections = yes`

之后，每次在启动器中点击 `Play` 时，会创建一个公开服务器，其他玩家即可加入。
> - 别忘了开放端口 8881（或您在 `listen_port` 中配置的其他端口）。
> - 您不必将 `server_online` 设为 `yes` 才能让其他玩家加入。您也可以将您的 IP 地址和服务器端口告知他们，让他们在游戏启动器中手动输入。您只需设置 `accept_remote_connections = yes`。

# 在专用服务器上安装模组
在专用服务器上，您需要使用 SteamCMD 手动下载模组，并配置服务器以找到它们。

## 1. 使用 SteamCMD 下载模组
使用 SteamCMD 下载 Workshop 模组。您可以将 SteamCMD 安装在系统的任意位置。

```bash
# 通过 Workshop ID 下载模组（将 WORKSHOP_ID 替换为实际 ID）
steamcmd +login anonymous +workshop_download_item 2941660 WORKSHOP_ID +quit
```

其中 `2941660` 是 Archean 的 Steam AppID，`WORKSHOP_ID` 是模组的 Workshop ID（可在模组的 Workshop URL 中找到）。

默认情况下，SteamCMD 将 Workshop 内容下载到：
- **Linux**: `~/.local/share/Steam/steamapps/workshop/content/2941660/`
- **Windows**: `<SteamCMD_install_path>/steamapps/workshop/content/2941660/`

您也可以使用 `+force_install_dir` 选项指定自定义下载目录。

## 2. 配置 external_mods_dir
在您的 `server.ini` 中，将 `external_mods_dir` 设置为已下载模组所在的目录：

```ini
[server]
external_mods_dir = /path/to/steamcmd/steamapps/workshop/content/2941660/
```

服务器将扫描此目录中包含 `repository` 文件的模组文件夹。

## 3. 为您的世界启用模组
编辑世界文件夹中的 `mods.txt` 文件：
```
Archean-data/server/worlds/<world_name>/mods.txt
```

每行添加一个模组名称。模组名称在模组的 `repository` 文件中定义（不是文件夹名称）。

示例 `mods.txt`：
```
MYVENDOR_mymod
OTHERVENDOR_anothermod
```

> - 如果 `mods.txt` 中列出的模组未找到，服务器将提示您继续或中止。
> - 模组名称（VENDOR_modname 格式）通常显示在模组的 Steam Workshop 页面上。

# 服务器配置 (server.ini)
`server.ini` 文件包含所有服务器设置。以下是可用参数的完整列表：

## 服务器设置
| 参数 | 默认值 | 说明 |
|-----------|---------|-------------|
| `server_online` | `no` | 服务器是否公开列出 |
| `server_public_name` | *（空）* | 在服务器列表中显示的名称 |
| `accept_remote_connections` | `no` | 允许玩家远程连接 |
| `max_simultaneous_players` | `16` | 最大同时在线玩家数 |
| `password` | *（空）* | 私人服务器密码（留空为公开） |
| `external_mods_dir` | *（空）* | 外部模组目录路径 |

## 游戏设置
| 参数 | 默认值 | 说明 |
|-----------|---------|-------------|
| `world` | *（空）* | 世界存档名称 |
| `spawn` | `earth` | 重生位置（天体） |
| `spawn_x`, `spawn_y`, `spawn_z` | Earth 坐标 | 重生点坐标 |

## 网络设置
| 参数 | 默认值 | 说明 |
|-----------|---------|-------------|
| `listen_port` | `8881` | 监听端口 |
| `listen_new_connection_timeout_ms` | `500` | 连接超时（毫秒） |
| `automatic_blacklist` | `no` | 自动将问题连接加入黑名单 |

## 性能设置
| 参数 | 默认值 | 说明 |
|-----------|---------|-------------|
| `updates_per_second` | `25` | 服务器 tick 速率（每秒更新次数） |
| `physics_steps_per_update` | `8` | 每个服务器 tick 的物理模拟步数 |
| `auto_save_interval_seconds` | `30` | 自动保存间隔（秒） |
| `screens_compression_level` | `2` | 屏幕压缩等级（0-9）。越低 = CPU 更快但带宽更大。越高 = CPU 更慢但带宽更小 |
| `server_loop_thread_cpu_affinity` | `-1` | 服务器循环线程的 CPU 核心亲和性（-1 = 自动） |

> **提示**：如果您的服务器因屏幕/仪表盘导致 CPU 负载较高，可以尝试将 `screens_compression_level` 降低到 0 或 1，以牺牲更多网络带宽换取更好的性能。

# 管理员管理
## 管理面板 (F4)
游戏内可通过 `F4` 键访问管理面板。
它显示服务器负载和每秒 tick 速率。*（25 ticks/s 是保证最佳性能的默认最大 tick 速率）*

`Admin Privileges` 复选框允许在游戏模式设为 `Adventure` 时免费生成 Blueprint 等功能。

面板提供两个标签页：
- **Players**：查看在线玩家列表、传送到玩家位置和/或踢出玩家。
- **Entities**：查看服务器上的实体列表（包含所有者和别名）、删除实体和/或传送到实体位置。还显示实体总数。

## 添加/移除管理员
要添加管理员，只需修改文件 `/Archean-data/server/admins.txt`。
此文件应包含玩家 ID 列表，每行一个。
如果玩家使用 Steam，应使用其 Steam64 ID。

## 管理员命令
管理员可以使用特殊的聊天命令。完整列表请参阅[聊天与命令](../misc/chat.md)，包括 `/ban` 命令。
