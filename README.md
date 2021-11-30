# Blog.io

> A blog website to track posts and users built using the Ruby on Rails framework.

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
# Create the database
rake db:create
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