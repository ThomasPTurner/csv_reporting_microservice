
requirements: 
```
docker
```

build and run the containers:

```
docker build -t csv .
docker run -it --rm -p 5000:5000 -v $PWD:/csv_reporting csv bash
```

now send a POST request to localhost:5000 with the body of the form:

```
{
	"fieldnames": ["name", "breakfast"],
	"data": [
		{
			"name" : "Tom",
			"breakfast": "beans"
		},
		{
			"name" : "Hayley",
			"breakfast": "eggs"
		}
	]
}
```

server will respond with a csv file:
```
name,breakfast
Tom,beans
Hayley,eggs

```
