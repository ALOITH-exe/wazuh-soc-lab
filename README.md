# Wazuh SIEM + Shuffle SOAR Home Lab

## Project Overview

This project builds a complete, zero-cost Security Operations Center (SOC) using open-source tools. The stack detects attacks, enriches alerts with threat intelligence, maps events to MITRE ATT&CK, and automates responses all running on a standard laptop.

**Key Achievement:** Sub-10 second detection-to-notification time for malware, brute force attacks, and credential dumping tools.

## Architecture
┌─────────────────┐
│ Kali WSL │
│ (Attacker) │
└────────┬────────┘
│
┌────┴────┐
│ │
▼ ▼
┌───────┐ ┌───────┐
│ Win10 │ │ Ubuntu│
│ Agent │ │ Agent │
└───┬───┘ └───┬───┘
│ │
└────┬────┘
│
▼
┌─────────────────┐
│ Wazuh Server │
│ (192.168.1.8) │
│ 8GB RAM │
└────────┬────────┘
│
┌────┴────┐
│ │
▼ ▼
┌───────┐ ┌───────┐
│Virus- │ │Shuffle│
│ Total │ │ Cloud │
└───────┘ └───┬───┘
│
▼
┌───────┐
│ Email │
└───────┘

## Components

| Component | Version | Purpose |
|-----------|---------|---------|
| Wazuh Server | 4.9.0 | SIEM manager, indexer, dashboard |
| Windows 10 Agent | 4.9.0 | Monitored endpoint |
| Ubuntu 22.04 Agent | 4.9.0 | Linux monitored endpoint |
| Kali Linux | WSL2 | Attack simulation |
| Shuffle SOAR | Cloud (Free) | Automation orchestration |
| VirusTotal API | Free tier | Threat intelligence |

## Hardware Requirements

| Component | Specification |
|-----------|---------------|
| CPU | 4+ cores (Intel i7-6820HQ used) |
| RAM | 16GB (8GB for Wazuh, 4GB Windows, 2GB Ubuntu) |
| Storage | 50GB+ for VMs |
| Virtualization | VMware Workstation or Hyper-V |

## Key Metrics

| Metric | Achieved |
|--------|----------|
| Mean Time to Detect | < 60 seconds |
| Mean Time to Notify | < 60 seconds |
| Vulnerabilities detected | 1,996 |
| Critical CVEs | 65 |


## Quick Start

1. Deploy Wazuh server using the all-in-one installer
2. Install Wazuh agents on Windows and Ubuntu endpoints
3. Configure VirusTotal integration with free API key
4. Create Shuffle workflow with webhook trigger
5. Add Shuffle integration to Wazuh `ossec.conf`
6. Test with EICAR file or SSH brute force

## Attack Simulations

| Attack | Command |
|--------|---------|
| EICAR Malware | `echo 'X5O!...' > eicar.com` |
| SSH Brute Force | `hydra -l root -P wordlist.txt ssh://<IP>` |
| Mimikatz | `.\mimikatz.exe "privilege::debug" "sekurlsa::logonpasswords"` |
| Port Scan | `nmap -sV <IP>` |

## Results

- ✅ Malware detection in <60 seconds
- ✅ VirusTotal enrichment (65/70 detection ratio)
- ✅ MITRE ATT&CK mapping (T1110, T1003, T1046)
- ✅ Automated email alerts via Shuffle
- ✅ 1,996 vulnerabilities identified and prioritized

## License

MIT - Free for educational and professional use.

## Author

Aftab Ahmed

## Acknowledgments

- Wazuh open-source community
- Shuffle SOAR team
- MITRE ATT&CK framework
