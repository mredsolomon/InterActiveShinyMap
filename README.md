# InterActiveShinyMap

this is what the web app looks like

https://mredsolo.shinyapps.io/InterActiveShinyMap/



Use the 'ASW setup script' to assist in setting up AWS instance of a server.

## AWS instance configuration:

1. AMI: Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type - ami-0998bf58313ab53d
2. Instance Type:  t2.micro => freetier eligible
3. Configure Instance Details: **PASTE 'AWS setup script' file in 'User data' text box; bottom of the page
4. Add-Storage: add more than 16 GiB to Size GiB) text box
5. Add Tags: nothing needed
6. Configure Security Group: configure as following
  Type        Protocal       Port Range     Source                        Description
  SSH         TCP            22             Anywhere:0.0.0.0/0, ::/0      Login
  HTTP        TCP            80             Anywhere:0.0.0.0/0, ::/0      HTTP
  Custom TCP  TCP            3838           Anywhere:0.0.0.0/0, ::/0      Shiny Server Default
  Custim TCP  TCP            8787           Anywhere:0.0.0.0/0, ::/0      RStudio server Default
7. Review
8. Launch

## resources
see https://aws.amazon.com/premiumsupport/knowledge-center/ec2-memory-swap-file/
see https://tm3.ghost.io/2017/12/31/deploying-an-r-shiny-app-to-aws/
see https://www.r-bloggers.com/shiny-server-on-aws/
see https://www.youtube.com/watch?v=0h9VOQZX6QM&t=15s
see https://www.youtube.com/watch?v=zJuFpqB01u4