# UBUS VIP (Verification IP) Project

## 1. 프로젝트 개요

이 프로젝트는 UBUS 프로토콜을 위한 UVM(Universal Verification Methodology) 기반의 검증 IP(VIP)를 구현합니다.

본 VIP는 UBUS Master 및 Slave Agent를 포함하고 있어, UBUS 프로토콜을 사용하는 다양한 DUT(Design Under Test)를 효과적으로 검증할 수 있는 환경을 제공합니다.

## 2. 디렉토리 구조

```
smc_vip/
├── my3_vip/
│   ├── ubus_if.sv
│   ├── my3_testbench_top.sv
│   └── ... (UVM agent, sequence, driver, monitor 등)
├── tb/
│   ├── run.sh
│   └── verdiLog/
└── README.md
```

- **`my3_vip/`**: UBUS Master/Slave VIP의 UVM 컴포넌트 소스 코드가 위치합니다.
- **`tb/`**: 테스트벤치 실행을 위한 스크립트 및 로그 파일이 위치합니다.

## 3. 컴파일 및 시뮬레이션 실행 방법

`tb` 디렉토리로 이동하여 `run.sh` 스크립트를 실행합니다.

```bash
# 1. tb 디렉토리로 이동
cd smc_vip/tb

# 2. 컴파일 및 시뮬레이션 실행
./run.sh
```

`run.sh` 스크립트는 VCS를 사용하여 `my3_testbench_top.sv`을 컴파일하고, `ubus_write_test`를 실행하여 시뮬레이션을 진행합니다. 시뮬레이션 로그는 `simv.log` 파일에 저장됩니다.
