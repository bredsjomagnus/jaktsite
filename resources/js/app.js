/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

import 'bootstrap/dist/css/bootstrap.min.css';
import 'mdbvue/build/css/mdb.css';

import VueSidebarMenu from 'vue-sidebar-menu';
import 'vue-sidebar-menu/dist/vue-sidebar-menu.css';
// Vue.use(VueSidebarMenu);

window.Vue = require('vue');

var sidebar = require('vue-sidebar-menu');

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
Vue.component('user-killreports', require('./components/UserKillreports.vue').default);
Vue.component('killreport-show', require('./components/KillreportShow.vue').default);
Vue.component('admin-navbar', require('./components/AdminNavbar.vue').default);
Vue.component('welcome', require('./components/Welcome.vue').default);
Vue.component('killreport-image-edit', require('./components/KillreportImageEdit.vue').default);
Vue.component('avatar-image-edit', require('./components/AvatarImageEdit.vue').default);
Vue.component('admin-index', require('./components/AdminIndex.vue').default);
Vue.component('data-index', require('./components/DataIndex.vue').default);

Vue.component('sidebar', require('./components/AdminIndex.vue'));

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});
