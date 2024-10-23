#!/bin/bash
#########################################################################################
# Install the aws-cli version on the box                                                #
# This assumes that you have already configured and logged in as per these instructions:#
# This also requires the jq utility (https://stedolan.github.io/jq/)                    #
#########################################################################################
#!/bin/bash

# Function to check if a command is installed
check_command_installed() {
    command -v "$1" &>/dev/null
}

# Function to install a package on CentOS/RHEL
install_package_centos() {
    sudo yum install -y "$1"
}

# Function to install a package on Ubuntu/Debian
install_package_ubuntu() {
    sudo apt-get update
    sudo apt-get install -y "$1"
}

# Function to install a package on macOS
install_package_macos() {
    brew install "$1"
}

# Function to check and install a package
check_and_install_package() {
    if ! check_command_installed "$1"; then
        # Check the operating system
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            # Linux
            if [ -f /etc/redhat-release ]; then
                # CentOS/RHEL
                install_package_centos "$1"
            elif [ -f /etc/lsb-release ]; then
                # Ubuntu/Debian
                install_package_ubuntu "$1"
            else
                echo "Unsupported Linux distribution."
                exit 1
            fi
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            # macOS
            install_package_macos "$1"
        else
            echo "Unsupported operating system."
            exit 1
        fi
    else
        echo "$1 is already installed."
    fi
}

# Main script

# Check and install jq
check_and_install_package "jq"

# Check and install zip
check_and_install_package "zip"


# Check if AWS CLI is already installed
if ! command -v aws &> /dev/null; then
    # If it's not installed, download and install it
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
    unzip -q awscliv2.zip
    sudo ./aws/install
    sudo ln -s /usr/local/bin/aws /usr/bin/aws
    echo "AWS CLI installed successfully."
    sudo rm -rf awscliv2.zip
    sudo rm -rf aws
else
    # If it's already installed, display a message
    echo "AWS CLI is already installed."
fi

# Profile may be provided as an argument
PROFILE=$1
# If not use the default profile
if [[ -z $PROFILE ]]; then PROFILE=default; fi

# uncomment if you want to configure the profile
# aws configure sso --profile $PROFILE

# AWS SSO login
aws sso login --profile $PROFILE

# Get all the things
ACCOUNT_ID=$( aws configure get sso_account_id --profile $PROFILE )
ROLE_NAME=$( aws configure get sso_role_name --profile $PROFILE )
CACHED_CREDS_FILE=$( ls -t ~/.aws/sso/cache/ | grep "^[0-9a-f]*.json" | head -1 )
ACCESS_TOKEN=$( cat ~/.aws/sso/cache/$CACHED_CREDS_FILE | jq .accessToken -r )
ROLE_CREDENTIALS=$( aws sso get-role-credentials --role-name $ROLE_NAME --account-id $ACCOUNT_ID --access-token $ACCESS_TOKEN )
# Save what we need to write to the credential file
AWS_ACCESS_KEY_ID=$( echo $ROLE_CREDENTIALS | jq .roleCredentials.accessKeyId -r )
AWS_SECRET_ACCESS_KEY=$( echo $ROLE_CREDENTIALS | jq .roleCredentials.secretAccessKey -r )
AWS_SESSION_TOKEN=$( echo $ROLE_CREDENTIALS | jq .roleCredentials.sessionToken -r )
# Write the credentials file
cat << EOF > ~/.aws/credentials
[$PROFILE]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
aws_session_token = $AWS_SESSION_TOKEN
EOF
exit
