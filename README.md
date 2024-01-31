# THM-VPN


1- Add cloudflare gpg key
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
​
2- Add this repo to your apt repositories
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ buster main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
​
3- Install
sudo apt update && sudo apt install cloudflare-warp
​
4- run warp-svc
warp-svc register&
​
5- register 
warp-cli register
​
6- connect 
warp-cli connect
