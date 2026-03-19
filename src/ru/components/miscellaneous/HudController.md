<p align="center">
  <img src="HudController.png" />
</p>

|Component|`HudController`|
|---|---|
|**Module**|`ARCHEAN_hud`|
|**Mass**|1 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|25 x 25 x 25 cm|
#
---

# Description

HUD Controller — компонент, позволяющий создавать HUD и отображать его на экране игрока при подписке. Например, он позволяет создавать один или несколько пользовательских интерфейсов на постройках.

# Usage
При размещении HUD Controller на постройке у него есть две кнопки:
- **Code**:
	- Открывает IDE XenonCode, где можно написать код для HUD. Подробнее см. раздел [HUD](../../xenoncode/hud.md).
- **Active**: 
	- Позволяет подписаться или отписаться от HUD Controller.

> Когда IDE открыт, вы автоматически подписаны на HUD Controller, пока IDE остаётся открытым.

## Управление через порт данных
### Использование с [Pilot Seat](../controllers/PilotSeat.md)
Подписка на HUD Controller также возможна через порт данных с помощью [Pilot Seat](../controllers/PilotSeat.md), который обладает уникальной способностью отправлять уникальный идентификатор (Token) на канале 0 (Using). Можно подключить [Pilot Seat](../controllers/PilotSeat.md) напрямую к порту данных HUD Controller, что позволит подписаться на HUD Controller при посадке в [Pilot Seat](../controllers/PilotSeat.md) и отписаться при выходе из него.

Также можно использовать [Pilot Seat](../controllers/PilotSeat.md), подключённый к [Computer](../computers/Computer.md), для подписки на HUD Controller. В этом случае необходимо использовать канал 0 (Using) [Pilot Seat](../controllers/PilotSeat.md) для отправки Token в порт данных HUD Controller. 

> - Убедитесь, что настройка `Emit user token on Channel 0` включена в информационном окне [Pilot Seat](../controllers/PilotSeat.md), доступном по клавише `V`. Это обеспечивает передачу Token пользователя на канале 0 [Pilot Seat](../controllers/PilotSeat.md) вместо `0` или `1`.
> - Рекомендуется не сохранять Token и не использовать его в коде напрямую. Token регенерируется при каждом подключении игрока к серверу по соображениям безопасности. Если злоумышленник получит Token другого игрока, он сможет отображать что угодно на HUD этого игрока без его ведома.

### HUD Controller для администраторов сервера
HUD Controller также может использоваться для создания HUD, видимого всем игрокам на сервере. 
Для этого администратору достаточно разместить [OwnerPad](OwnerPad.md) на постройке, где находится HUD Controller.

Затем подключите HUD Controller к [Computer](../computers/Computer.md) и отправьте текст `*` на канал 0 HUD Controller, чтобы подписать его на все токены.

> **Примечание**: Когда администратор сервера создаёт HUD Controller для всех игроков, его нельзя отключить. Поэтому необходимо следить за тем, чтобы не создавать HUD Controller, который может мешать игрокам.
