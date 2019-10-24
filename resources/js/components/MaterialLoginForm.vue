<template>
  <!-- Material form login -->
  <!-- @submit.prevent="submitForm" -->
  <form @submit.prevent="submitForm">
    <p class="h4 text-center mb-4">Logga in</p>
    <div class="grey-text">
      <mdb-input label="Användarnamn" icon="user" v-model="fields.username" type="text"/>
      <mdb-input label="Lösenord" icon="lock" v-model="fields.password" type="password"/>
    </div>
    <div class="text-center">
      <mdb-btn color="mdb-color" type="submit"><mdb-icon icon="sign-in-alt" class="ml-1"/> - Logga in</mdb-btn>
    </div>
    <input type="hidden" name="_token" :value="csrf">
  </form>
  <!-- Material form login -->
</template>
<script>
  import axios from "axios";
  import { mdbInput, mdbBtn, mdbIcon } from 'mdbvue';
  export default {
    name: 'Basic',
    components: {
      mdbInput,
      mdbBtn,
      mdbIcon
    },
    data() {
        return {
            csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            fields: {
              username: "",
              password: ""
            },
            log: {
              path: window.location.pathname
            }
        }
    },
    methods: {
      submitForm(event) {
        console.log(window.location.pathname);
        // console.log(event)
          axios
            .post("http://localhost:8080/www/jaktsite/public/login", this.fields)
            .then(response => {
              this.fields = {};
              console.log(response.request.responseURL)
              window.location = response.request.responseURL;
            })
            .catch(error => {
              console.log(error);
            });
      }
    }
    
  }
</script>