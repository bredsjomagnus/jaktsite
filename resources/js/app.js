/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

import 'bootstrap/dist/css/bootstrap.min.css';
import 'mdbvue/build/css/mdb.css';

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('material-profile-card', require('./components/MaterialProfileCard.vue').default);
Vue.component('material-login-form', require('./components/MaterialLoginForm.vue').default);
Vue.component('material-register-form', require('./components/MaterialRegisterForm.vue').default);
Vue.component('material-navbar', require('./components/MaterialNavbar.vue').default);
Vue.component('killreport-create', require('./components/KillreportCreate.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});
