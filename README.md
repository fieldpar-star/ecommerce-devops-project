# E-Commerce DevOps Project

A full-stack e-commerce product management application with CI/CD pipeline.

## Architecture

- **Frontend**: React + Nginx
- **Backend**: Node.js + Express
- **Database**: PostgreSQL
- **Containerization**: Docker
- **Orchestration**: Docker Compose
- **CI/CD**: GitHub Actions

## Features

- ✅ RESTful API with CRUD operations
- ✅ Modern React UI
- ✅ PostgreSQL database with persistent storage
- ✅ Multi-stage Docker builds
- ✅ Automated CI/CD pipeline
- ✅ Health checks and monitoring
- ✅ Production-ready configuration

## Prerequisites

- Docker & Docker Compose
- Node.js 18+ (for local development)
- Git
- Docker Hub account (for CI/CD)

## Quick Start

### Development Environment

```bash
# Clone the repository
git clone <your-repo-url>
cd ecommerce-devops-project

# Start all services
docker-compose up --build

# Access the application
open http://localhost
```

### Production Deployment

```bash
# Set environment variables
export DOCKER_USERNAME=your-dockerhub-username
export DB_PASSWORD=your-secure-password

# Deploy using production compose file
docker-compose -f docker-compose.prod.yml up -d
```

## API Endpoints

### Products

- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get single product
- `POST /api/products` - Create product
- `PUT /api/products/:id` - Update product
- `DELETE /api/products/:id` - Delete product

### Health Check

- `GET /health` - Service health status

## CI/CD Pipeline

The project uses GitHub Actions for automated:

1. **Build**: Builds Docker images for backend and frontend
2. **Test**: Runs automated tests
3. **Push**: Pushes images to Docker Hub
4. **Deploy**: Deploys to production (when merged to main)

### Setup GitHub Secrets

Add these secrets to your GitHub repository:

- `DOCKER_USERNAME`: Your Docker Hub username
- `DOCKER_PASSWORD`: Your Docker Hub password/token

## Project Structure

```
ecommerce-devops-project/
├── .github/
│   └── workflows/
│       └── ci-cd.yml
├── backend/
│   ├── app.js
│   ├── package.json
│   ├── Dockerfile
│   └── .dockerignore
├── frontend/
│   ├── src/
│   ├── public/
│   ├── package.json
│   ├── Dockerfile
│   ├── nginx.conf
│   └── .dockerignore
├── docker-compose.yml
├── docker-compose.prod.yml
└── README.md
```

## Environment Variables

### Backend

- `PORT`: Server port (default: 3000)
- `DB_HOST`: PostgreSQL host
- `DB_PORT`: PostgreSQL port (default: 5432)
- `DB_USER`: Database user
- `DB_PASSWORD`: Database password
- `DB_NAME`: Database name

## Development

### Backend

```bash
cd backend
npm install
npm start
```

### Frontend

```bash
cd frontend
npm install
npm start
```

## Docker Commands

```bash
# Build images
docker-compose build

# Start services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down

# Remove volumes
docker-compose down -v
```

## Monitoring

- Frontend: http://localhost
- Backend API: http://localhost:3000
- Health Check: http://localhost:3000/health

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

MIT License