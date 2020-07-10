


##### Get bearer token before api call

Assuming following is the bearer token api response and need to use 

```json
{
    "access_token_key": "eyJhtCW6lpIg0NMn_hko7c9DZzS2SBKNwyeyBmUa6xn3bFyAtCIOMnh86dfOQcOZGd429xPMqDxPiGRrONpGV7llUmwY4RVAmXaaT0oX6Mo.vuuYtNT28CzrZHdZ.q3BTx9cC11F6FCaBys7QDsVaTQPERU8lCvLdym9wV-Z-u-RNbw8QNSgAPUgZCOfyWGNusG_M6FxF4jI7GOhuSBwz2xqGwk6_5qO3UxGcQfJ9bv3rQ48bHD0fFCWwCWvID9K58pKGXT2UkE8Hau4KK7dFffPY3lZq7Qj2tBqbseMOl_EBhdD-pfgjkWsna-peFdmnXcrnXyZqHeFrFisSFadhCMHUOJ1h3bKP0EWtUoQgaCMqn7QUDPekKw_LJ2252-lAsjHU15SLuw64B8zPgmo0MOl4HjE67h4ywwGOb7xThYTSKIKicfkJ1KmgX9QQ3SGP_iuaG413pqv9kiNeQ_uxP0grSY5Ffzz6bUewJAJMiZDBNoJ5ItliNu8WSPQ6TNsztmiMJEF7JuYzxEstrMZHsuQoj8sZX-8TUA3i4wUqVFJakRNjhy0Z4sBqCYsGGo7bYJzgUA.VBHlZQF3lZgdMTHGKo2Y4w",
    "token_type": "Bearer",
    "expires_duration": 300,
    "expires": "2020-07-10T07:41:09Z",
    "issued": "2020-07-10T07:36:09Z",
    "refresh_token_key": "sizGGu32X66lRJjqTUTF2A,pgVKddjuWM-px8i0QN5R1w"
}
```

Now One of the api needs access_token_key as authorization, then how can we get this access key before making request??

Using postman, we can do this by using Pre-req. tab.

1. create global variable
   Click on manage environment --> globals --> create variable `jwttoken`
  
2. Use this `jwttoken` global variable as authorization value 
    Click on Auth --> select `TYPE` as `Bearer token` -> Insert value of Token as `{{jwttoken}}`
   
3. Now write Pre-req script which will get executed before every request

```javascript
  const echoPostRequest = {
  url: "<token-url>",
  method: "POST",

  header: {
      	    "Content-Type":"application/x-www-form-urlencoded",
	    "Accept":"application/json",
	    "Cache-Control":"no-cache",
	    "Keep-Alive":"timeout=3600"
  },
  body: {
    mode: "urlencoded",
    urlencoded: [
	  {key: "grant_type", value: "password", disabled: false},
	  {key: "username", value: "<username>", disabled: false},
	  {key: "password", value: "<password>", disabled: false},
	  {key: "user_type", value: "<if applicable>", disabled: false}
    ]
   }
};

pm.sendRequest(echoPostRequest, function (err, response) {
    console.log(response.json());
    //note: access to token in response
    pm.globals.set("jwttoken", response.json().access_token_key);
});





```
