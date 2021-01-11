<h2>Nodejs Api and HTML</h2>
<table>
    <tr>
        <td>API</td>
        <td>Nodejs</td>
        <td>JS</td>
        <td>HTML</td>
    </tr>
</table>

To work with our API, we use fetch to send http request.
We create a js object then, turn it into json data, 


Create user html page fetch script : 
```js
    //Api route
    let api_url = "http://localhost:3000/items/create_user";
    
    //Request
    fetch(api_url, {
        method: 'POST',
        body: req_data_jsoned,
        headers:{'content-type': 'application/json'}
    })
        .then(response => response.json())
        .then(json => {
            console.log(json);
       });      
```

Login fetch route : 
```js
   let api_url = "http://localhost:3000/items/login";
```


