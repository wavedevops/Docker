```bash
#!/bin/bash

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${RED}Removing all docker containers, images, volumes and networks${NC}"

docker rm -f $(docker ps -aq) 2>/dev/null
docker system prune -a --volumes -f 2>/dev/null
docker volume prune -a -f 2>/dev/null

echo
echo -e "${GREEN}===== Containers =====${NC}"
docker ps -a

echo
echo -e "${YELLOW}===== Images =====${NC}"
docker images

echo
echo -e "${BLUE}===== Volumes =====${NC}"
docker volume ls

echo
echo -e "${CYAN}===== Networks =====${NC}"
docker network ls

echo
echo -e "${GREEN}===== Docker cleanup completed =====${NC}"
```
