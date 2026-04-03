#  Hybrid-Cloud Python Microservice: The DevSecOps Blueprint

##  Project Aim
The goal of this project was to architect a high-availability FastAPI microservice using a **Hybrid-Cloud CI/CD approach**. By splitting the workflow between GitHub (Developer CI) and GitLab (Enterprise CD), I demonstrated how to maintain local agility while leveraging self-hosted infrastructure for security-intensive tasks like SonarQube analysis and Docker builds.

##  Tech Stack & Tools
| Category | Tool |
| :--- | :--- |
| **Backend** | Python 3.11, FastAPI, Uvicorn |
| **CI (Developer)** | GitHub Actions, Pytest |
| **CD (Enterprise)** | GitLab CI/CD, Self-hosted EC2 Runner |
| **Quality/Security** | SonarQube (LTS Community), Docker-in-Docker |
| **Infrastructure** | AWS EC2 (Ubuntu), Docker Hub |

##  Architecture Overview
1. **GitHub Phase:** Code push triggers unit tests and linting to ensure PR quality.
2. **GitLab Phase:** Verified code is mirrored to GitLab, where a self-hosted Runner executes a deep security scan.
3. **Delivery:** Passing builds are containerized and pushed to Docker Hub.
4. **Deployment:** The Runner executes a remote SSH script to update the production container on AWS.

## Lessons Learnt
- **Infrastructure over Cloud-Managed:** Setting up a self-hosted GitLab Runner on EC2 taught me more about networking and permissions than any cloud-managed service ever could.
- **Security Gates:** Integrating SonarQube early prevents "technical debt" from reaching production. I learned that a green pipeline isn't enough; it must be a *secure* pipeline.
- **Variable Masking:** Handling SSH keys and Docker tokens taught me the critical importance of CI/CD secret management—never leak your keys!

## 🚦 Getting Started
1. Clone the repo.
2. Run `pip install -r requirements.txt`.
3. Launch locally with `uvicorn app.main:app --reload`.