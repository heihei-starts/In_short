import Vue from 'vue/dist/vue.esm.js'
import Mean from './components/mean.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import axios from 'axios'
var app = new Vue ({
  el:'#app',

  components: {
    'meanbar': Mean,
  }


})
