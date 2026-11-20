# INDX PLA with PETG supports

[![Check](https://github.com/tlchandler/indx-pla-petg-supports/actions/workflows/check.yml/badge.svg)](https://github.com/tlchandler/indx-pla-petg-supports/actions/workflows/check.yml)
[![License: AGPL-3.0](https://img.shields.io/badge/License-AGPL--3.0-blue.svg)](LICENSE)

A PrusaSlicer 3 Print Goal for the **Prusa CORE One INDX**: PLA parts, including multi-colour PLA,
on a PETG support interface that peels off cleanly.

> [!IMPORTANT]
> Made and tested on the CORE One INDX, and offered only for INDX printers.

## Install

Install **INDX PLA with PETG supports** from the Plugin Marketplace in PrusaSlicer 3. Or copy the
`indx-pla-petg-supports` folder into the `lua` folder of your PrusaSlicer 3 data directory and
choose **Plugins → Rescan**.

## Use

Load PLA for the part and PETG in another INDX tool. In **Print Goals**, turn on
**INDX PLA with PETG supports** and set **INDX PETG tool** to the PETG tool.

| Option | Default | |
|---|---|---|
| INDX PETG tool | 2 | Tool loaded with PETG. |
| PLA tool for support body | 0 | 0 = the PLA already printing on each layer. Set a PLA tool when using a raft. |
| Interface layers | 5 | 2 solid PLA + 3 PETG. |
| Interface loop | on | One loop around the PETG interface. |

## What it sets

- Support interface on the PETG tool; support body on PLA. The part's tools are not changed.
- Top and bottom contact Z distance 0, interface spacing 0, 5 top and 5 bottom interface layers.
- *Soluble material* on the PETG tool, which makes the lower interface layers solid PLA so the PETG
  lies flat.
- Supports everywhere, snug instead of organic, no wipe tower.

## INDX tips

- Let a PLA tool print the first layer; the bed temperature follows the first tool.
- Each layer with PETG adds a tool change, so keep overhangs flat where you can.
- Dry the PETG.

## License

Adapted from Prusa Research's *Breakaway interface supports* print goal in
[PrusaSlicer](https://github.com/prusa3d/PrusaSlicer), licensed under the [AGPL-3.0](LICENSE).
