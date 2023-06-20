###### This script downloads all artifacts from Azure DevOps and uploads them to GitHub packages ######

#!/bin/bash

# Get the Azure DevOps organization and project ID.
export ORGANIZATION_ID="<your-organization-id>"
export PROJECT_ID="<your-project-id>"

# Get the Azure Artifacts feed ID.
export FEED_ID="<your-feed-id>"

# Get the personal access token with the `Artifacts:Read` scope.
export PAT="<your-pat>"

# Get the GitHub organization and repository name.
export ORGANIZATION="<your-organization>"
export REPOSITORY="<your-repository>"

# Get the GitHub token with the `repo` scope.
export TOKEN="<your-token>"

# Create the output directory.
mkdir -p artifacts

# Download all artifacts from the feed.
az artifacts download --organization $ORGANIZATION_ID --project $PROJECT_ID --feed $FEED_ID --output artifacts

# Upload all artifacts to GitHub Packages.
for artifact in $(find artifacts -type f); do
  echo "Uploading artifact: $artifact"
  dotnet nuget push -s github -k $TOKEN $artifact
done

# Display a success message.
echo "All artifacts have been downloaded and uploaded successfully."
