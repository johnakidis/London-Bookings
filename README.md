London Bookings is a website developed for my undergraduate thesis.
The website is developed by building an ontology with Protege and then exporting data from https://www.openstreetmap.org/ using http://overpass-turbo.eu/ and then interlinking that data with https://schema.org/ to create .nt files so that we can create a SPARQL endpoint.The endpoint was created using http://www.strabon.di.uoa.gr/ and stored to a PostgreSQL database with a postgis template.
The website was developed in eclipse using html,css,java,javascript and a javascript library jquery.
Also a database was created for users and reservations with PostgreSQL.
The endpoint was queried through HTTP GET requests with java.

Start page:

![Index](https://github.com/johnakidis/thesisws/blob/master/readmepng/start-page-10-sc.png)
![Index](https://github.com/johnakidis/thesisws/blob/master/readmepng/start-page-2-sc.png)

If the user is logged in:

![Index](https://github.com/johnakidis/thesisws/blob/master/readmepng/start-page-log-sc.png)

Sign-up page:

![Index](https://github.com/johnakidis/thesisws/blob/master/readmepng/sign-up-sc.png)

Profil page:

![Index](https://github.com/johnakidis/thesisws/blob/master/readmepng/profil-sc.png)

Hotels view+search page:

![Index](https://github.com/johnakidis/thesisws/blob/master/readmepng/hotels-sc.png)

Hotel reservation page:

![Index](https://github.com/johnakidis/thesisws/blob/master/readmepng/book-sc.png)

See past reservations and rate them:

![Index](https://github.com/johnakidis/thesisws/blob/master/readmepng/past-b-sc.png)

See future reservations and cancel them:

![Index](https://github.com/johnakidis/thesisws/blob/master/readmepng/future-b-sc.png)

View restaurants and search them:

![Index](https://github.com/johnakidis/thesisws/blob/master/readmepng/rest-sc.png)

View hospitals and search them:

![Index](https://github.com/johnakidis/thesisws/blob/master/readmepng/hospital-sc.png)
