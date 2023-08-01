// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require select_all.js

import "@hotwired/turbo-rails"
import "controllers"

const button = document.getElementById("render")
const posts = document.getElementsByClassName("posts")
const teste = document.getElementById("renderizar")
console.log(teste)

$(function() {
  $("#selectAll").select_all();
});