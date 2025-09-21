FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

FROM tomcat:9.0
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh","run"]

//commands
docker build -t lmswarimage .
docker run -d -p 7089:8080 --name lmswarcontainer lmswarimage
docker ps
docker login
docker tag lmswarimage aakarshabandi/lmswarimage:latest   // tag you image for dockerhub
docker push aakarshabandi/lmswarimage:latest
docker stop lmswarcontainer
docker rm lmswarcontainer    //remove container
docker images



//git

# Initialize Git in the current folder
git init

# Set your global username (only needed once per machine)
git config --global user.name "YourName"

# Set your global email (only needed once per machine)
git config --global user.email "youremail@example.com"

# Stage all changes (new/modified files) for commit
git add .

# Commit staged changes with a message
git commit -m "Your commit message"
//
$ git remote add origin https://github.com/Aakarshabandi/campusmanagement.git
error: remote origin already exists.

# If remote origin already exists, update it to your new repo URL
git remote set-url origin https://github.com/Aakarshabandi/campusmanagement.git

# Verify the remote URL
git remote -v

# Rename the default branch to main (if not already main)
git branch -M main

# Push commits to GitHub and set upstream to main
git push -u origin main

# Pull latest changes from GitHub (if needed, e.g., before editing)
git pull origin main
