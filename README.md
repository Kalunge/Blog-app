# Blog.io

> A blog website to track posts and users built using the Ruby on Rails framewor![Screenshot from 2021-12-07 19-40-53](https://user-images.githubusercontent.com/50773868/145087762-1d9c3d22-6131-4eca-b909-ae89c74c7f8c.png)
> 

![Screenshot from 2021-12-07 19-40-41](https://user-images.githubusercontent.com/50773868/145087818-044e8976-b4f2-47df-84dc-c9d2556a980e.png)

## Built With

- Ruby on Rails
- PostgreSQL

## Getting Started

To get a local copy up and running follow these simple example steps.



### Setup

- Make sure you have Ruby on Rails set up properly on your computer
- Clone or download this repo on your machine
  
  ```git clone git@github.com:Kalunge/Blog-app.git```
- cd into project directory
  
  ``` cd Blog-app```

### Development Database

```sh
# Create user
sudo -u postgres createuser blog -s
# To recreate database for view testing
rake db:reset
```

### Install

```sh
bundle install
```

### Run

```sh
rails s
```

### Test

```sh
rspec
```

## Author

👤 **Titus Muthomi**

- GitHub: [@Kalunge](https://github.com/Kalunge)
- Twitter: [@titus_muthomi](https://twitter.com/titus_muthomi)
- LinkedIn: [Titus Muthomi](https://www.linkedin.com/in/muthomi-titus-295024181/)
## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Kalunge/Blog-app/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## License

[MIT](./LICENSE)
