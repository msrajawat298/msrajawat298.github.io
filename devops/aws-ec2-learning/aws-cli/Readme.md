Check Key Pair Existence:
============================
aws ec2 describe-key-pairs --key-name my-ec2-key --region ap-south-1

Create Key Pair on aws using aws cli ::
================================================================
aws ec2 create-key-pair --key-name my-ec2-key --query 'KeyMaterial' --output text > my-ec2-key.pem

To delete a key pair from AWS EC2, you can use the aws ec2 delete-key-pair command. Here are the steps:
aws ec2 delete-key-pair --key-name my-ec2-key-terrform --region ap-south-1
