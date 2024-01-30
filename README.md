# THM-VPN


setup process 
steps:
Add cloudflare gpg key<br/>
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
​
Add this repo to your apt repositories
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ buster main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
​
Install
sudo apt update && sudo apt install cloudflare-warp
​
run warp-svc
warp-svc register&
​
register 
warp-cli register
​
connect 
warp-cli connect
