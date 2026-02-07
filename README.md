# OpenCLAW Installation Guide

This repository contains automated installation scripts and Docker configuration for **OpenCLAW** - a toolkit for solving hyperbolic conservation laws using the Clawpack ecosystem.

## 📋 Table of Contents

- [Quick Start](#quick-start)
- [Method 1: Direct Installation Scripts](#method-1-direct-installation-scripts)
- [Method 2: Docker Installation](#method-2-docker-installation)
- [Method 3: GitHub Actions (Cloud Build)](#method-3-github-actions-cloud-build)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)

---

## 🚀 Quick Start

### For Linux/macOS Users:
```bash
chmod +x install.sh
./install.sh
```

### For Windows Users:
```bash
install.bat
```

### For Docker Users:
```bash
docker build -t openclaw:latest .
docker run -it openclaw:latest
```

---

## Method 1: Direct Installation Scripts

### Linux/macOS Installation

**Requirements:**
- Ubuntu/Debian or macOS
- sudo access
- Internet connection

**Steps:**
1. Clone this repository:
   ```bash
   git clone https://github.com/e1001kim-coder/-.git
   cd -
   ```

2. Make the script executable:
   ```bash
   chmod +x install.sh
   ```

3. Run the installation script:
   ```bash
   ./install.sh
   ```

**What it does:**
- Updates system packages
- Installs build-essential, cmake, and git
- Clones OpenCLAW from GitHub
- Builds and installs OpenCLAW

### Windows Installation

**Requirements:**
- Windows 10/11
- Administrator access
- Internet connection

**Steps:**
1. Clone this repository or download `install.bat`
2. Double-click `install.bat` to run it
3. Wait for the installation to complete

**What it does:**
- Verifies Python is installed
- Verifies Git is installed
- Installs CMake if needed
- Installs Clawpack
- Downloads and builds OpenCLAW

---

## Method 2: Docker Installation

Docker is the **recommended method** for a clean, isolated environment.

### Prerequisites:
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
- 4GB+ free disk space

### Steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/e1001kim-coder/-.git
   cd -
   ```

2. Build the Docker image:
   ```bash
   docker build -t openclaw:latest .
   ```

3. Run the container:
   ```bash
   docker run -it openclaw:latest
   ```

### Using with Local Files:

To work with files on your host system:

```bash
# Create a data directory
mkdir -p data

# Run container with volume mount
docker run -it -v $(pwd)/data:/openclaw/data openclaw:latest

# Windows:
docker run -it -v %cd%/data:/openclaw/data openclaw:latest
```

### Common Docker Commands:

```bash
# List images
docker images | grep openclaw

# Remove image
docker rmi openclaw:latest

# Run with specific Python version
docker run -it openclaw:latest python3 --version
```

---

## Method 3: GitHub Actions (Cloud Build)

This repository includes automated GitHub Actions workflow that builds OpenCLAW in the cloud.

### How it works:
- Automatically triggers on every push
- Builds on Ubuntu latest
- Runs tests automatically
- No local setup needed

### View Build Status:
1. Go to: https://github.com/e1001kim-coder/-/actions
2. Click on the latest workflow run
3. View the build logs

---

## ✅ Verification

### Check Installation (After any method):

**Linux/macOS/Windows with Python:**
```bash
python -c "import clawpack; print(clawpack.__version__)"
```

**In Docker:**
```bash
docker run openclaw:latest python3 -c "import clawpack; print(clawpack.__version__)"
```

**Expected output:**
```
5.x.x  (version number)
```

### Test OpenCLAW:
```bash
# In Docker or after script installation
python -c "from clawpack import pyclaw; print('OpenCLAW is ready!')"
```

---

## 🔧 Troubleshooting

### Script Installation Issues:

**Problem: "Permission denied" on Linux/macOS**
```bash
chmod +x install.sh
./install.sh
```

**Problem: Python not found**
- Install Python 3.7+ from https://www.python.org/

**Problem: Git not found**
- Install Git from https://git-scm.com/

**Problem: CMake not found**
```bash
pip install cmake
```

### Docker Issues:

**Problem: "Docker daemon is not running"**
- Start Docker Desktop application

**Problem: Permission denied**
```bash
# Linux: Add user to docker group
sudo usermod -aG docker $USER
newgrp docker
```

**Problem: Out of disk space**
```bash
docker system prune -a
```

### General Issues:

**Check if OpenCLAW is in PATH:**
```bash
which openclaw
```

**View detailed installation logs:**
```bash
# Script installation
./install.sh 2>&1 | tee install.log

# Docker build
docker build -t openclaw:latest . 2>&1 | tee docker-build.log
```

---

## 📚 Additional Resources

- [Clawpack Official Site](https://www.clawpack.org/)
- [OpenCLAW GitHub](https://github.com/clawpack/openclaw)
- [Clawpack Installation Guide](https://www.clawpack.org/installing.html)
- [Docker Documentation](https://docs.docker.com/)

---

## 📝 File Structure

```
e1001kim-coder/-/
├── install.sh                    # Linux/macOS installation script
├── install.bat                   # Windows installation script
├── Dockerfile                    # Docker configuration
├── .github/
│   └── workflows/
│       └── build.yml            # GitHub Actions workflow
└── README.md                     # This file
```

---

## ⚡ System Requirements

### Minimum (Script Installation):
- CPU: 2 cores
- RAM: 2GB
- Disk: 2GB free space
- OS: Ubuntu 18.04+, macOS 10.14+, Windows 10+

### Recommended (Docker):
- CPU: 4 cores
- RAM: 4GB
- Disk: 5GB free space

---

## 🎯 Next Steps

After installation, you can:
1. Run OpenCLAW examples
2. Develop custom applications
3. Contribute to the Clawpack project

For more information, visit: https://www.clawpack.org/

---

**Questions?** Open an issue on GitHub!