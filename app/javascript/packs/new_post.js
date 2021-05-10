import Vue from 'vue/dist/vue.esm.js'
import New from './components/new_post.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

var app = new Vue ({
  el: '#app',

  components: {
    'newbar': New,
  }


})
