import Vue from 'vue/dist/vue.esm.js'
import Router from './router/router'
import Header from './components/header.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import axios from 'axios'
var app = new Vue ({
    router: Router,
    el:'#appHeader',
    
    components: {
        'navbar': Header,
    }
})
