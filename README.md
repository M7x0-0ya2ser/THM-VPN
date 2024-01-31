# THM-VPN

📌 This tool was a task in [CAT Reloaded](https://catreloaded.org/) community

---

![image](https://github.com/M7x0-0ya2ser/THM-VPN/assets/115821128/65c32395-d6ef-4d3b-8a02-f8eb41ceb598)

---

▶ At first you should downloads the configration file from [THM](https://tryhackme.com/r/access) 

---

### Before you start to use the tool if you aren't install cloudflare-warp follow the next steps, if already installed skip the 6 next steps


```bash
1- Add cloudflare gpg key
- curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

2- Add this repo to your apt repositories
- echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ buster main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list

3- Install
- sudo apt update && sudo apt install cloudflare-warp

4- run warp-svc
- warp-svc register&

5- register
- warp-cli register

6- connect
- warp-cli connect
```
---
### Before you start to use the tool if you aren't install openvpn follow the next steps, if already installed skip the next steps

```bash
1- sudo apt update
2- sudo apt install openvpn
```



### To install and use tool<br/>
```bash
1- git clone https://github.com/M7x0-0ya2ser/THM-VPN.git
2- cd THM-VPN
3- chmod +x THM-VPN.sh
4- sudo ./THM-VPN.sh
```

---
### Use of tool
**first time of use you should choose 3 to store openvpn file path that you downloaded from THM ( be careful to write path /home/user/path not ~/path )**


