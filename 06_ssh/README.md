# ssh

1. **Create SSH Keys**
    ```shell
    ssh-keygen -t ed25519 -C "vlutz" -f ~/.ssh/github.com
    ```

2. **Add Key to Server**
    ```shell
    ssh-copy-id -i "~/.ssh/github.com" vlutz@insert_server_hostname
    ```

3. **Add Key to GitHub**
   - Go to [GitHub SSH Keys Settings](https://github.com/settings/keys)

4. **Run the Installation Script**
    ```shell
    bash install.sh
    ```