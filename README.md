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
    * soft_directory: ansible项目根目录
    * sqlite_version： sqlite版本
    * python_version： python版本
    * sqlite_install_directory： sqlite安装路径
    * role：运行项目的登录角色
    * repo_url： django项目
    * repo_directory： git 本机存储目录
    * git_pro_name： git项目名
    * live_pro_name： 线上项目名