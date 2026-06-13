# System Requirements

## Hardware Requirements

| Component | Minimum | Recommended | Used in This Lab |
|-----------|---------|-------------|------------------|
| CPU Cores | 4 | 8 | Intel i7-6820HQ (4 cores) |
| RAM | 12GB | 16GB+ | 16GB |
| Storage | 50GB | 100GB+ | 50GB allocated |
| Network | Any | Bridged mode capable | Bridged mode |

## Software Requirements

| Software | Version | Download |
|----------|---------|----------|
| VMware Workstation | 17+ | https://www.vmware.com/products/workstation-pro.html |
| Ubuntu Server | 22.04 LTS | https://ubuntu.com/download/server |
| Ubuntu Desktop | 22.04 LTS | https://ubuntu.com/download/desktop |
| Windows 10 ISO | 22H2+ | Microsoft official source |
| WSL2 | Latest | Windows feature |
| Kali Linux | Latest | Microsoft Store or `wsl --install` |

## Wazuh Components

| Component | Version | RAM Allocation |
|-----------|---------|----------------|
| Wazuh Manager | 4.9.0 | Included in server |
| Wazuh Indexer | 4.9.0 | Included in server |
| Wazuh Dashboard | 4.9.0 | Included in server |
| Windows Agent | 4.9.0 | ~100MB |
| Ubuntu Agent | 4.9.0 | ~50MB |

## API Keys Required

| Service | Free Tier Limit | Signup URL |
|---------|-----------------|------------|
| VirusTotal | 500 requests/day | https://www.virustotal.com |
| Shuffle SOAR | 10,000 runs/month | https://shuffler.io |

## Network Configuration

All VMs must be on the same bridged network for proper communication.

| VM | IP Address | Network Mode |
|----|------------|--------------|
| Wazuh Server | DHCP or static 192.168.1.8 | Bridged |
| Windows Agent | DHCP | Bridged |
| Ubuntu Agent | DHCP | Bridged |
| Kali WSL | DHCP (via Hyper-V switch) | Bridged |
