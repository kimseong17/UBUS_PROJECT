# UBUS VIP (Verification IP) Project

## 1. 프로젝트 개요
이 프로젝트는 UBUS 프로토콜을 위한 UVM(Universal Verification Methodology) 기반의 검증 IP(VIP)를 구현합니다.
본 VIP는 UBUS Master 및 Slave Agent를 포함하고 있어, UBUS 프로토콜을 사용하는 다양한 DUT(Design Under Test)를 효과적으로 검증할 수 있는 환경을 제공합니다.

## 2. 디렉토리 구조


```text
FINAL/
├── common_vip/</span>
│ ├── my3_testbench_top.sv
│ ├── my3_vip_environment.sv
│ ├── packet.sv
│ ├── ananlysis_imp
│ │ ├── master_analysis_imp.sv
│ │ └── slave_analysis_imp.sv
│ ├── covereage_seq
│ ├── ubus_if/
│ │ ├── ubus_m_if.sv
│ │ └── ubus_s_if.sv
│ ├── dummy_dut.sv
│ ├── ubus_scoreboard.sv
│ ├── ubus_virtual_sequence.sv
│ ├── ubus_virtual_sequencer.sv
│ ├── ubus_coverage.sv
│ └── ubus_virtual_sequence_test.sv
│
├── master_vip/
│ ├── master_agent.sv
│ ├── master_driver.sv
│ ├── master_monitor.sv
│ ├── master_sequencer.sv
│ └── master_seq/
│   ├── ubus_master_write_word_seq.sv
│   ├── ubus_master_read_word_seq.sv
│   ├── ubus_master_write_random_size_seq.sv
│   └── ubus_master_read_random_size_seq.sv
│ 
├── slave_vip/
│ ├── slave_agent.sv
│ ├── slave_driver.sv
│ ├── slave_monitor.sv
│ ├── slave_sequencer.sv 
│ └── slave_sequence.sv
│
├── common_sim/
│ └── Makefile
│
└── README.md
```


  

- **`common_vip/`**: UBUS Master/Slave VIP의 UVM 컴포넌트 소스 코드가 위치합니다.

- **`tb/`**: 테스트벤치 실행을 위한 스크립트 및 로그 파일이 위치합니다.

  

## 3. 컴파일 및 시뮬레이션 실행 방법
`sim` 디렉토리로 이동하여 `make` 명령어를 실행합니다.

```bash
# 1. tb 디렉토리로 이동
cd common_sim/

# 2. make 명령어 실행

# 랜덤 시뮬레이션 실행
make random N_REPEAT=100 RANDOM_SEED=127   # N_REPEAT: read/write 반복 횟수, RANDOM_SEED: 시드 값 지정

# 생성된 파일 정리
make clean                                 # Makefile을 제외한 모든 생성 파일 삭제

# Verdi 실행 (fsdb 자동 로드)
make verdi                                 # wave.fsdb 자동 로드 후 Verdi 실행
```

## 4. 주차별 프로젝트 진행도
| 주차  | 주제                                                    |
| --- | ----------------------------------------------------- |
| 1주차 | UBUS Interface Overview, VIP 구조 설계                    |
| 2주차 | Test, Environment 작성, Transaction 구현                  |
| 3주차 | Master agent, Slave agent 구현, Sequence Implementation |
| 4주차 | System Environment Integration (Master & Slave)       |
| 5주차 | Driving the System Environment with Virtual Sequence  |
| 6주차 | Functional Coverage                                   |

## 5. Sequence List


## 6. Coverage
