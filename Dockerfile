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



###########################################
# -------------------------------
# GIT BASIC COMMANDS CHEAT SHEET
# -------------------------------

# Check Git version
git --version                         # Show installed Git version

# Set global username and email (only once per machine)
git config --global user.name "YourName"
git config --global user.email "youremail@example.com"
git config --global color.ui auto      # Optional: colorize Git output

# Initialize a new Git repository
git init                               # Initialize Git in current folder

# Check status of files
git status                              # See untracked, staged, modified files

# Stage files for commit
git add filename                        # Stage a specific file
git add .                               # Stage all changes

# Commit staged changes
git commit -m "Commit message"          # Commit with a message

# View commit history
git log                                 # Full commit log
git log --oneline                        # Short commit history

# View differences
git diff                                 # Show unstaged changes
git diff --staged                         # Show staged changes

# Undo changes
git checkout -- filename                 # Undo changes in file (before commit)
git reset HEAD filename                  # Unstage a file
git revert <commit-hash>                 # Revert a commit (safe)
git reset --hard <commit-hash>           # Reset to specific commit (destructive)

# Remote repositories
git remote -v                             # Show remote URLs
git remote add origin <repo-URL>          # Add remote repository
git remote set-url origin <repo-URL>      # Change remote URL
git remote remove origin                  # Remove a remote

# Push and pull
git push -u origin main                   # Push changes to GitHub
git push origin branch-name               # Push a specific branch
git pull origin main                      # Pull latest changes from GitHub
git fetch origin                           # Fetch updates without merging
git merge origin/main                      # Merge fetched changes

# Branching
git branch                                # List all branches
git branch new-feature                     # Create a new branch
git checkout new-feature                   # Switch to a branch
git checkout -b new-feature                # Create + switch to a branch
git merge new-feature                      # Merge a branch into current branch
git branch -d new-feature                  # Delete a local branch
git push origin --delete new-feature       # Delete remote branch

# Tags
git tag                                    # List tags
git tag v1.0                               # Create a tag
git push origin v1.0                        # Push tag to remote

# Cloning a repository
git clone <repo-URL>                        # Clone a repo to local machine

# Stashing changes (optional)
git stash                                  # Save uncommitted changes temporarily
git stash pop                              # Reapply stashed changes

# Viewing a commit
git show <commit-hash>                     # Show details of a commit
