**Production URL**: http://ecommerce-alb-dev-XXXXXXX.us-east-1.elb.amazonaws.com

## Architecture
```
GitHub → CI/CD (GitHub Actions) → Docker Hub → AWS ECS Fargate
                                                    ↓
                                    Application Load Balancer
                                                    ↓
                                    Frontend + Backend Services
                                                    ↓
                                    RDS PostgreSQL Database
```

## Tech Stack

- **Frontend**: React, Nginx
- **Backend**: Node.js, Express
- **Database**: PostgreSQL (AWS RDS)
- **Containerization**: Docker
- **Orchestration**: AWS ECS Fargate
- **Load Balancing**: AWS ALB
- **CI/CD**: GitHub Actions
- **Infrastructure**: Terraform (IaC)
- **Registry**: Docker Hub
- **Monitoring**: CloudWatch

## Features

Full CRUD operations
Automated CI/CD pipeline
Infrastructure as Code
Cloud-native architecture
Production-ready security
Scalable microservices