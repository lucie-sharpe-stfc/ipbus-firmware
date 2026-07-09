# IPB Example project for Intel Agilex 7 FPGA I-Series Transceiver Development Kit (6x F-Tile)

- Ensure you have access to Quartus 24.3.1
- Run the following:

```bash
curl -L https://github.com/ipbus/ipbb/archive/v0.5.2.tar.gz | tar xvz
source ipbb-0.5.2/env.sh

ipbb init ipb_dev
cd ipb_dev

ipbb add git git@github.com:lucie-sharpe-stfc/ipbus-firmware.git -b v1.14.1_agilex_support

mkdir -p proj/quartus_ipbus_example
cd proj/quartus_ipbus_example/

quartus_sh -t ../../src/ipbus-firmware/projects/altera/firmware/cfg/create_project.tcl quartus_ipbus_example
sh ../../src/ipbus-firmware/projects/altera/firmware/cfg/generate_ip.sh

quartus_sh --flow compile quartus_ipbus_example -c top
```

- Program the dev board with the generated `top.sof`

- You can now ping the dev board with IP: `192.168.200.17`
