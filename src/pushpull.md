# Push & Pull

In Archean, items and fluids don't move by themselves. Every transfer between two components follows a **Push/Pull** model: one side must actively initiate the action, and the other side must accept it.

Understanding this system is essential to building functional setups. Each component's wiki page indicates its Push/Pull mode in the info table at the top.

## The Three Roles

### Initiate
A component that **initiates** an action actively starts the transfer. It will push items/fluids to whatever is connected to its output, or pull from whatever is connected to its input.

### Accept
A component that **accepts** an action is passive. It can receive a push or respond to a pull, but it will never start a transfer on its own.

### Forward
A component that **forwards** an action passes it through to the other side. It doesn't store anything — it simply relays the push or pull action from one port to the other.

> Forwarders are transparent: if something pushes into one side of a Bridge, the Bridge pushes into whatever is on the other side. Same for pulls.

## How It Works

- **Push**: The source sends items/fluids to the destination. The source decides *what* and *when* to send.
- **Pull**: The destination requests items/fluids from the source. The destination decides *what* and *when* to retrieve.

A connection only works when one side **initiates** and the other side **accepts** (or forwards to something that accepts). Two passive components connected together will never transfer anything.

---

## A Common Mistake

Consider this setup: **Mining Drill → Container → Crusher**

The Drill **initiates push**, so rocks arrive in the Container. But the Container only **accepts** — it will never push anything out on its own. And the Crusher only **accepts push** — it won't pull from the Container either. Result: rocks pile up in the Container and nothing reaches the Crusher.

### Solutions

**Mining Drill → Crusher → Container**
The Drill pushes rocks to the Crusher, which accepts them, processes them, and pushes the resulting ores to the Container.

**Mining Drill → Container → Item Conveyor → Crusher → Container**
The [Item Conveyor](components/items/ItemConveyor.md) is an **initiator** — it actively pulls from the first Container and pushes to the Crusher. This is useful when you want to buffer rocks or control the flow rate.

---

## Reading Component Pages

Every component page shows its Push/Pull mode in the info table:

| Mode | Meaning |
|---|---|
| `Initiate Push` | Actively pushes to its output |
| `Initiate Pull` | Actively pulls from its input |
| `Initiate Push/Pull` | Actively does both |
| `Accept Push` | Passively receives pushes |
| `Accept Pull` | Passively responds to pulls |
| `Accept Push/Pull` | Passively does both |
| `Accept Push/Pull -> Forwards action to other side` | Relays actions through |

Some components combine roles — for example, the Crusher **accepts push** on its input (rocks in) and **initiates push** on its output (ores out).
