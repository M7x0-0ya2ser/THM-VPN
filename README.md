# THM-VPN
<br/>
<br/>
setup process <br/>
<br/>
steps:<br/>
1- Add cloudflare gpg key<br/>
`curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg`<br/>
​<br/>
2- Add this repo to your apt repositories<br/>
`echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ buster main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list`<br/>
​<br/>
3- Install<br/>
`sudo apt update && sudo apt install cloudflare-warp`<br/>
​<br/>
4- run warp-svc<br/>
`warp-svc register&`<br/>
​<br/>
5- register <br/>
`warp-cli register`<br/>
​<br/>
6- connect <br/>
`warp-cli connect`<br/>
