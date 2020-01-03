# Implementing CI/CD in Ansible

## Install ansible/git on CentOS
    sudo yum install -y ansible
    sudo yum install -y git

## clone ansible project from git repository
    git clone https://github.com/huaigegegege/ansibles.git

## Automatically build online environment. CI.yml
    cd ansibles
    ansible-playbook -i hosts CI.yml

## Automatically deploy or upgrade django projects
    ansible-playbook -i hosts CD.yml

### note
    * soft_directory : ansible项目根目录