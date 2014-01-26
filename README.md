This API completes the following challenge:

1. Send parallel requests to all four services 
2. If you receive a success response (status 200) parse the body and extract the IP(v4) 
3. Once you receive the same IP from two different providers, return the result immediately, don't wait for any outstanding requests to complete 

The services to query are:
1. http://checkip.amazonaws.com/ 
2. http://checkip.dyndns.org/ 
3. http://ifconfig.me/ip 
4. http://corz.org/ip