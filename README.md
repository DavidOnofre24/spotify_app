# spotify_app

Version de Flutter: 3.7.12

Importate: 

Se debe crear un archivo .env donde dentro tenga las siguientes variables de entorno, por si desean probar:

- CLIENT_ID="e70684a3862e4fab8bd4a06bdfb01d73"
- CLIENT_SECRET="da4b98d9faa045ca85742b21609863f9"
- REDIRECT_URI="pruebacastor://callback"

Estas variables son las de Spotify Api.

Para iniciar la aplicacion se debe ejecutar los siguientes comandos:

- flutter pub get

iOS:
- cd ios
- pod install 

Generar aplicacion Android:
- flutter run build bundle 

Generar aplicacion iOS:
- flutter run build ipa


Deudas tecnicas: 

- Mejorar repository SpotifyRepository y datasource RemoteSpotifyDataSource separar por album,track...

- Utilizar mas widget customizados y ordenar los widget mejor de las screens para que sea mas entendible

- app_router separar los bloc provider en otros archivos para que no sea vea asi en el router

- En el archivo de inyeccion de dependencias separar Casos de uso,Repositorios... en archivos diferentes 


Mejoras en la app:

- Mejorar screen de Artista diseño y funcionalidad, podemos agregar mas funcionalidad como por ejemplo mostrar las canciones top...

- Mejorar screen de Album diseño y funcionalidad 

- Agregar icono en la app 



