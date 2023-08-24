# Ulearning App
This application is built using flutter and [laravel as the backend](https://github.com/kisahtegar/ulearning_app_laravel). This application can be used to manage learning using [laravel admin](https://laravel-admin.org/docs/en/), upload videos, and there are also payments using [Stripe](https://stripe.com/).

<table>
  <th><h3>🛠️ Features</h3></th>
  <tr>
    <!-- features -->
    <td>
      <ul>
        <li>Authentication.</li>
        <li>Uploading video.</li>
        <li>Video player.</li>
        <li>Payment with Stripe.</li>
      </ul>
    </td>
  </tr>
</table>

## 📋 Previews
This the output application after running the project.
<p align="center">
  <img src="https://raw.githubusercontent.com/kisahtegar/ulearning_app/main/previews/flutter_01.png"  width="200" height="400"/>
  <img src="https://raw.githubusercontent.com/kisahtegar/ulearning_app/main/previews/flutter_02.png"  width="200" height="400"/>
  <img src="https://raw.githubusercontent.com/kisahtegar/ulearning_app/main/previews/flutter_03.png"  width="200" height="400"/>
  <img src="https://raw.githubusercontent.com/kisahtegar/ulearning_app/main/previews/flutter_04.png"  width="200" height="400"/>
  <img src="https://raw.githubusercontent.com/kisahtegar/ulearning_app/main/previews/flutter_05.png"  width="200" height="400"/>
  <img src="https://raw.githubusercontent.com/kisahtegar/ulearning_app/main/previews/flutter_06.png"  width="200" height="400"/>
  <img src="https://raw.githubusercontent.com/kisahtegar/ulearning_app/main/previews/flutter_07.png"  width="200" height="400"/>
  <img src="https://raw.githubusercontent.com/kisahtegar/ulearning_app/main/previews/flutter_08.png"  width="200" height="400"/>
</p>

## 🧪 Getting Started
Start your [laravel as the backend](https://github.com/kisahtegar/ulearning_app_laravel), host and port optional you can modify:

    php artisan serve --host=192.168.0.15 --port=8000

Our laravel backend using [ngrok](https://ngrok.com) for testing against your development backend. Build webhook consumers and demo websites without deploying: 

    ngrok http http://192.168.0.15:8000 

After that, we need to run our flutter application:

    flutter run

You also can change the server url application in:

    lib\common\values\constant.dart

## ✨ About Us
- 💻 All of my projects/repository are available at [github.com/kisahtegar](https://github.com/kisahtegar)
- 📫 How to reach me **code.kisahtegar@gmail.com**
- 📄 Know about my experiences [kisahcode.web.app](https://kisahcode.web.app)