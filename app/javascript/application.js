// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const button = document.getElementById("render")
const posts = document.getElementsByClassName("posts")
const teste = document.getElementById("renderizar")
console.log(teste)

button.addEventListener("click", () =>{
  posts.append("oi")
})